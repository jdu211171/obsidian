# Project Foundation

```bash
composer create-project laravel/laravel project-name
```

If you want to install breeze, you can run the following command:

```bash
composer require laravel/breeze --dev
php artisan breeze:install
```

### Database setup

- Create database in your DBMS
- Configure .env (DB_* settings)
- Create migrations first (before models):

Model Layer (Before Controllers)

```bash
php artisan make:model ModelName -mfcsr
```

-m *migration* (if not already made)
-f *factory*
-c *controller*
-s *seeder*
-r *resource*

Define relationships and $fillable in models
You can also use $protected to define relationships

### Authentication

Setup authentication scaffolding

```bash
php artisan make:auth
```

### Middleware

Middleware is a way to filter HTTP requests entering your application. 
For example, Laravel includes a middleware that verifies the user of your application is authenticated.
If the user is not authenticated, the middleware will redirect the user to the login screen. 
However, if the user is authenticated, the middleware will allow the request to proceed further into the application.

```bash
php artisan make:middleware MiddlewareName
```

### Controllers

Controllers are the heart of your application, as they determine how HTTP requests should be handled.

```bash
php artisan make:controller ControllerName
```

### Requests

Form requests are custom request classes that contain validation logic.

```bash
php artisan make:request RequestName
```

### Resources and Collections

Resources allow you to transform your models and model collections into JSON.

```bash
php artisan make:resource ResourceName
```

Collections are simply resources that are returned as a collection.

```bash
php artisan make:resource ResourceName --collection
```

### Requests

Form requests are custom request classes that contain validation logic.

```bash
php artisan make:request RequestName
```

### Factories

Factories are a convenient way to generate large amounts of database records using model factories.

```bash
php artisan make:factory FactoryName
```

### Migrations

Migrations are like version control for your database, allowing your team to easily modify and share the application's database schema.

```bash
php artisan make:migration MigrationName
```

### Seeders

Seeders are classes that allow you to populate your database with sample data for testing.

```bash
php artisan make:seeder SeederName
```

### Model Binding

Model binding provides a convenient way to inject class instances into your route callbacks.

```php
Route::get('profile/{user}', function (App\Models\User $user) {
    return $user;
});
```

Model binding in Controllers helps to reduce the amount of boilerplate code needed to retrieve a model instance.

```php
public function show(User $user)
{
    return view('user.profile', ['user' => $user]);
}
```

### Eloquent ORM

Eloquent is Laravel's built-in ORM (Object-Relational Mapping) implementation.

```php
$users = User::all();
```

### Query Builder

The query builder is a fluent interface to create and run database queries.

```php
$users = DB::table('users')->get();
```

### Pagination

Laravel's paginator is integrated with the query builder and Eloquent ORM.
It simplifies the process of creating paginated views.

```php
$users = DB::table('users')->paginate(15);
```
### Eloquent: Relationships

Eloquent relationships are defined as methods on your Eloquent model classes.

```php
class User extends Model
{
    public function phone()
    {
        return $this->hasOne(Phone::class);
    }
}
```

One to Many Relationship

```php
class Post extends Model
{
    public function comments()
    {
        return $this->hasMany(Comment::class);
    }
}
```

Many to Many Relationships

```php
class User extends Model
{
    public function roles()
    {
        return $this->belongsToMany(Role::class);
    }
}
```

### Iterative flow of API development in laravel

1. Create a new Laravel Project
2. Create a new Model with all the things you need (migration, factory, controller, seeder, resource)
3. Create a new Request for validation
4. Create a new Middleware for authorization
5. Setup the routes in the api.php file
6. Setup the policies and gates for authorization

Recommended Workflow:
1. Start with protected routes (auth)
2. Build resource CRUD operations
3. Add custom functionality after base CRUD works
4. Implement authorization last (after basic functionality)

## API Route File Organization (api.php)

```php
// Versioning (recommended)
Route::prefix('v1')->group(function () {
    // Public routes
    Route::post('/login', [AuthController::class, 'login']);
    Route::post('/register', [AuthController::class, 'register']);

    // Protected routes
    Route::middleware('auth:sanctum')->group(function () {
        // Common authenticated routes
        Route::get('/profile', [ProfileController::class, 'show']);
        Route::apiResource('posts', PostController::class);

        // Admin routes
        Route::middleware('role:admin')->group(function () {
            Route::apiResource('users', UserController::class);
            Route::post('/users/{user}/ban', [UserController::class, 'ban']);
        });

        // Moderator routes
        Route::middleware('role:moderator')->group(function () {
            Route::post('/posts/{post}/publish', [PostController::class, 'publish']);
        });
    });
});
```

### Best Practices for API Endpoints
- RESTful Design
- Use proper HTTP verbs: GET, POST, PUT/PATCH, DELETE
- Resource naming: /posts, /posts/{id}/comments
- Versioning: /api/v1/...

#### Response Standards

- Use JSON as the response format:
```json
{
    "success": true,
    "data": [],
    "meta": {
        "count": 0,
        "pagination": {
            "https://api.example.com/posts?page=2"
        }
    },
}
```

- Error Handling:
```json
{
    "success": false,
    "error": {
        "code": 403,
        "message": "Unauthorized",
    }
}
```

## Role-Based Routing Implementation

Step 1: Create Role Middleware

```bash
php artisan make:middleware RoleMiddleware
```

Step 2: Register Middleware in Kernel

```php
protected $routeMiddleware = [
    'role' => \App\Http\Middleware\RoleMiddleware::class,
];
```

Step 3: Implement Role Middleware

```php
public function handle(Request $request, Closure $next, ...$roles)
{
    
    if (!auth()->check()) {
        return response()->json(['error' => 'Unauthenticated'], 401);
    }

    if (! $request->user() || ! $request->user()->hasRole($roles)) {
        abort(403);
    }

    return $next($request);
}
```

Step 4: Implement hasRole() method in User model

```php
public function hasRole($roles)
{
    return in_array($this->role, $roles);
}
```

Step 5: Use Role Middleware in Grouped Routes

```php
Route::middleware('role:admin,superadmin')->group(function () {
    Route::apiResource('users', UserController::class);
});
```

### Policy-Based authorization

Step 1: Create a new Policy

```bash
php artisan make:policy PostPolicy --model=Post
```

Step 2: Define the Policy methods

```php
public function view(User $user, Post $post)
{
    return $user->id === $post->user_id;
}
```

Step 3: Register the Policy in AuthServiceProvider

```php
protected $policies = [
    Post::class => PostPolicy::class,
];
```

Step 4: Use the Policy in Controller

```php
public function show(User $user, Post $post)
{
    $this->authorize('view', $post);
    return new PostResource($post);
}
```

### Gates

Gates are closures that determine if a user is authorized to perform a given action.

Step 1: Define the Gate in AuthServiceProvider

```php
Gate::define('publish-post', function (User $user, Post $post) {
    return $user->id === $post->user_id;
});
```

Step 2: Use the Gate in Controller

```php
public function publish(User $user, Post $post)
{
    if (Gate::allows('publish-post', $post)) {
        $post->published = true;
        $post->save();
        return new PostResource($post);
    }
    abort(403);
}
```

## Advanced Organization Techniques

1. Split Routes into Multiple Files

```php
// routes/api.php
Route::prefix('v1')->group(function () {
    require __DIR__.'/api/auth.php';
    require __DIR__.'/api/admin.php';
    require __DIR__.'/api/user.php';
});
```

2. Controller Organization

```
app/Http/Controllers/API
├── V1
│   ├── AuthController.php
│   ├── Admin
│   │   ├── UserController.php
│   │   └── ReportController.php
│   └── User
│       ├── PostController.php
│       └── ProfileController.php
```

3. Route Model Binding with Authorization

```php
// In controller
public function update(Request $request, Post $post)
{
    $this->authorize('update', $post);
    // Update logic
}
```

4. Security Best Practices
- Authentication
- Use Laravel Sanctum or Passport
- Token expiration
- Refresh tokens

5. Rate Limiting
- Prevent abuse of your API
- Use Laravel's built-in rate limiting middleware

```php
Route::middleware('auth:sanctum', 'throttle:api')->group(function () {
    Route::get('/user', function () {
        //
    });
});
Route::middleware(['auth:sanctum', 'throttle:60,1'])->group(function () {
    // Your routes
});
```

6. CORS Handling
- Use fruitcake/laravel-cors package

7. API Documentation
- Use Swagger or Postman
- Consider darkaonline/l5-swagger package
- Keep your API documentation up-to-date

Example Role-Based Endpoint Flow:
```
Client Request -> Sanctum Auth -> Role Middleware -> Policy/Gate Check -> Controller
```

Key Tips:
- Use apiResource instead of resource for APIs (excludes create/edit routes)
- Always return proper HTTP status codes
- Use standardized error formats
- Implement proper CORS headers
- Use API resources for response formatting

These structure maintains scalability, separates concerns, and makes role management straightforward.
Start with broad role groups and narrow down permissions as needed.

### Artisan Commands

make commands:
```bash
  make:component            Create a new view component class
  make:controller           Create a new controller class
  make:enum                 Create a new enum
  make:factory              Create a new model factory
  make:interface            Create a new interface
  make:middleware           Create a new HTTP middleware class
  make:migration            Create a new migration file
  make:model                Create a new Eloquent model class
  make:request              Create a new form request class
  make:resource             Create a new resource
  make:seeder               Create a new seeder class
  make:view                 Create a new view
```

make:controller commands:
```bash
  make:controller           Create a new controller class
  make:controller --api     Create a new API controller class
  make:controller --model   Create a new controller class for a model
```

make:factory commands:
```bash
  make:factory              Create a new model factory
  make:factory --model      Create a new factory for a model
```

make:migration commands:
```bash
  make:migration            Create a new migration file
  make:migration --create   Create a new migration file for a specific table
  make:migration --table    Create a new migration file for a specific table
```

make:model commands:
```bash
  make:model                     Create a new Eloquent model class
  make:model --all               Create a new Eloquent model class, migration, and factory
  make:model --controller        Create a new Eloquent model class and a controller
  make:model --factory           Create a new Eloquent model class and a factory
  make:model --migration         Create a new Eloquent model class and a migration
  make:model --pivot             Create a new Eloquent model class for a pivot table
  make:model -mfrcs --requests   Create a new Eloquent model class, migration, factory, resource, controller, and requests
```

make:request commands:
```bash
  make:request              Create a new form request class
  make:request --api        Create a new form request class for API requests
```

make:resource commands:
```bash
  make:resource             Create a new resource
  make:resource --collection
```

make:seeder commands:
```bash
  make:seeder               Create a new seeder class
  make:seeder --model       Create a new seeder class for a model
```

migrate commands:
```bash
  migrate                  Run the database migrations
  migrate:fresh            Drop all tables and re-run all migrations
  migrate:install          Create the migration repository
  migrate:refresh          Reset and re-run all migrations
  migrate:reset            Rollback all database migrations
  migrate:rollback         Rollback the last database migration
  migrate:status           Show the status of each migration
```

seed commands:
```bash
  db:seed                  Seed the database with records
  db:wipe                  Drop all tables, views, and types
  db:seed --class=ClassName
```

Here's a comprehensive list of essential Artisan commands for API development in Laravel, including key optional parameters to boost your productivity:

---

### **1. Model & Database Setup**
```bash
# Create model with migration, factory, resource controller (API ready)
php artisan make:model Product -mfrc

# Create migration (with table definition)
php artisan make:migration CreateProductsTable --create=products

# Run migrations
php artisan migrate

# Create factory (with model relationship)
php artisan make:factory ProductFactory --model=Product

# Create seeder
php artisan make:seeder ProductSeeder

# Seed database
php artisan db:seed --class=ProductSeeder
```

---

### **2. Controller & Routes**
```bash
# Create API resource controller (no create/edit methods)
php artisan make:controller API/ProductController --api --model=Product

# Create form request validation
php artisan make:request StoreProductRequest

# Generate resource controller + model + migration + factory + seeder + policy + requests
php artisan make:model Product --all
```

---

### **3. Authentication & Security**
```bash
# Install Laravel Sanctum (API token authentication)
composer require laravel/sanctum
php artisan sanctum:install

# Publish Sanctum config
php artisan vendor:publish --provider="Laravel\Sanctum\SanctumServiceProvider"

# Generate authentication scaffolding
php artisan make:auth
```

---

### **4. Middleware & Authorization**
```bash
# Create middleware for role checking
php artisan make:middleware EnsureUserIsAdmin

# Create policy for model authorization
php artisan make:policy ProductPolicy --model=Product

# Create gate (define in AuthServiceProvider)
# No Artisan command needed - edit app/Providers/AuthServiceProvider.php
```

---

### **5. API Resources**
```bash
# Create API resource (transforms models to JSON responses)
php artisan make:resource ProductResource

# Create resource collection (pagination support)
php artisan make:resource ProductCollection --collection
```

---

### **6. Testing & Debugging**
```bash
# Create feature test
php artisan make:test ProductApiTest --pest

# Run all tests
php artisan test

# Run specific test
php artisan test --filter=testCreateProduct

# Start Tinker (API experimentation)
php artisan tinker
```

---

### **7. Route Management**
```bash
# List all registered routes
php artisan route:list --except-vendor

# Cache routes (production optimization)
php artisan route:cache

# Clear route cache
php artisan route:clear
```

---

### **8. Advanced Generators**
```bash
# Create custom Artisan command
php artisan make:command ProcessOrders

# Generate event + listener + observer
php artisan make:event OrderShipped
php artisan make:listener SendShipmentNotification --event=OrderShipped
php artisan make:observer ProductObserver --model=Product
```

---

### **9. Optional Parameters Cheat Sheet**
| Command                      | Flags                         | Description                                                                 |
|------------------------------|-------------------------------|-----------------------------------------------------------------------------|
| `make:model`                 | `-mfrcs` (all-in-one)        | Model + Migration + Factory + Resource Controller + Seeder                 |
| `make:controller`            | `--api --model=Product`      | API resource controller pre-bound to model                                  |
| `make:policy`                | `--model=Product`            | Policy with pre-defined methods for model                                   |
| `make:resource`             | `--collection`               | Create collection resource instead of single                               |
| `make:test`                  | `--pest`                     | Generate Pest test instead of PHPUnit                                       |
| `db:seed`                    | `--class=UserSeeder`         | Run specific seeder class                                                   |
| `make:request`               | `--force`                    | Overwrite existing request class                                            |

---

### **Key Workflow for API Development**
1. **Model Setup**: `make:model -mfrc`
2. **Database**: Create migration → Edit → `migrate`
3. **Controller**: `make:controller --api --model=...`
4. **Routes**: Define in `api.php` with middleware groups
5. **Validation**: `make:request`
6. **Authorization**: `make:policy --model=...`
7. **Response Formatting**: `make:resource`
8. **Testing**: `make:test --pest`

---

### **Pro Tips**
1. Use model binding in routes: 
```php
Route::apiResource('products', ProductController::class)
     ->middleware('auth:sanctum');
```

2. Combine with Sanctum middleware:
```php
Route::middleware(['auth:sanctum', 'ability:admin,editor'])->group(function () {
    // Protected routes
});
```

3. Use `--all` flag for rapid prototyping:
```bash
php artisan make:model Order --all
# Generates: Model, Migration, Factory, Seeder, Controller, Policy, Form Requests
```

These commands and patterns will help you maintain a clean, scalable API architecture while leveraging Laravel's automation capabilities.
