
Welcome to the tutorial! We'll be building a small, but feature-rich app that lets you keep track of your contacts. We expect it to take between 30-60m if you're following along.
We'll be using [Vite](https://vitejs.dev/guide/) for our bundler and dev server for this tutorial. You'll need [Node.js](https://nodejs.org/) installed for the `npm` command line tool.

###### 👉️ **Open up your terminal and bootstrap a new React app with Vite:**

```sh
npm create vite@latest name-of-your-project -- --template react
# follow prompts
cd <your new project directory>
npm install react-router-dom localforage match-sorter sort-by
npm run dev
```
You should be able to visit the URL printed in the terminal:

```
 VITE v4.4.9  ready in 175 ms

  ➜  Local:   http://127.0.0.1:5173/
  ➜  Network: use --host to expose
```

###### 👉 **Copy/Paste the tutorial CSS into `src/index.css`** 

```css
html {
  box-sizing: border-box;
}
*,
*:before,
*:after {
  box-sizing: inherit;
}

body {
  font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", "Roboto", "Oxygen",
    "Ubuntu", "Cantarell", "Fira Sans", "Droid Sans", "Helvetica Neue",
    sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}

code {
  font-family: source-code-pro, Menlo, Monaco, Consolas, "Courier New",
    monospace;
}

html,
body {
  height: 100%;
  margin: 0;
  line-height: 1.5;
  color: #121212;
}
textarea,
input,
button {
  font-size: 1rem;
  font-family: inherit;
  border: none;
  border-radius: 8px;
  padding: 0.5rem 0.75rem;
  box-shadow: 0 0px 1px hsla(0, 0%, 0%, 0.2), 0 1px 2px hsla(0, 0%, 0%, 0.2);
  background-color: white;
  line-height: 1.5;
  margin: 0;
}
button {
  color: #3992ff;
  font-weight: 500;
}

textarea:hover,
input:hover,
button:hover {
  box-shadow: 0 0px 1px hsla(0, 0%, 0%, 0.6), 0 1px 2px hsla(0, 0%, 0%, 0.2);
}

button:active {
  box-shadow: 0 0px 1px hsla(0, 0%, 0%, 0.4);
  transform: translateY(1px);
}

#contact h1 {
  display: flex;
  align-items: flex-start;
  gap: 1rem;
}
#contact h1 form {
  display: flex;
  align-items: center;
  margin-top: 0.25rem;
}
#contact h1 form button {
  box-shadow: none;
  font-size: 1.5rem;
  font-weight: 400;
  padding: 0;
}
#contact h1 form button[value="true"] {
  color: #a4a4a4;
}
#contact h1 form button[value="true"]:hover,
#contact h1 form button[value="false"] {
  color: #eeb004;
}

form[action$="destroy"] button {
  color: #f44250;
}

.sr-only {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  white-space: nowrap;
  border-width: 0;
}

#root {
  display: flex;
  height: 100%;
  width: 100%;
}

#sidebar {
  width: 22rem;
  background-color: #f7f7f7;
  border-right: solid 1px #e3e3e3;
  display: flex;
  flex-direction: column;
}

#sidebar > * {
  padding-left: 2rem;
  padding-right: 2rem;
}

#sidebar h1 {
  font-size: 1rem;
  font-weight: 500;
  display: flex;
  align-items: center;
  margin: 0;
  padding: 1rem 2rem;
  border-top: 1px solid #e3e3e3;
  order: 1;
  line-height: 1;
}

#sidebar h1::before {
  content: url("data:image/svg+xml,%3Csvg width='25' height='18' viewBox='0 0 25 18' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M19.4127 6.4904C18.6984 6.26581 18.3295 6.34153 17.5802 6.25965C16.4219 6.13331 15.9604 5.68062 15.7646 4.51554C15.6551 3.86516 15.7844 2.9129 15.5048 2.32334C14.9699 1.19921 13.7183 0.695046 12.461 0.982805C11.3994 1.22611 10.516 2.28708 10.4671 3.37612C10.4112 4.61957 11.1197 5.68054 12.3363 6.04667C12.9143 6.22097 13.5284 6.3087 14.132 6.35315C15.2391 6.43386 15.3241 7.04923 15.6236 7.55574C15.8124 7.87508 15.9954 8.18975 15.9954 9.14193C15.9954 10.0941 15.8112 10.4088 15.6236 10.7281C15.3241 11.2334 14.9547 11.5645 13.8477 11.6464C13.244 11.6908 12.6288 11.7786 12.0519 11.9528C10.8353 12.3201 10.1268 13.3799 10.1828 14.6234C10.2317 15.7124 11.115 16.7734 12.1766 17.0167C13.434 17.3056 14.6855 16.8003 15.2204 15.6762C15.5013 15.0866 15.6551 14.4187 15.7646 13.7683C15.9616 12.6032 16.423 12.1505 17.5802 12.0242C18.3295 11.9423 19.1049 12.0242 19.8071 11.6253C20.5491 11.0832 21.212 10.2696 21.212 9.14192C21.212 8.01428 20.4976 6.83197 19.4127 6.4904Z' fill='%23F44250'/%3E%3Cpath d='M7.59953 11.7459C6.12615 11.7459 4.92432 10.5547 4.92432 9.09441C4.92432 7.63407 6.12615 6.44287 7.59953 6.44287C9.0729 6.44287 10.2747 7.63407 10.2747 9.09441C10.2747 10.5536 9.07172 11.7459 7.59953 11.7459Z' fill='black'/%3E%3Cpath d='M2.64217 17.0965C1.18419 17.093 -0.0034949 15.8971 7.72743e-06 14.4356C0.00352588 12.9765 1.1994 11.7888 2.66089 11.7935C4.12004 11.797 5.30772 12.9929 5.30306 14.4544C5.29953 15.9123 4.10366 17.1 2.64217 17.0965Z' fill='black'/%3E%3Cpath d='M22.3677 17.0965C20.9051 17.1046 19.7046 15.9217 19.6963 14.4649C19.6882 13.0023 20.8712 11.8017 22.3279 11.7935C23.7906 11.7854 24.9911 12.9683 24.9993 14.4251C25.0075 15.8866 23.8245 17.0883 22.3677 17.0965Z' fill='black'/%3E%3C/svg%3E%0A");
  margin-right: 0.5rem;
  position: relative;
  top: 1px;
}

#sidebar > div {
  display: flex;
  align-items: center;
  gap: 0.5rem;
  padding-top: 1rem;
  padding-bottom: 1rem;
  border-bottom: 1px solid #e3e3e3;
}

#sidebar > div form {
  position: relative;
}

#sidebar > div form input[type="search"] {
  width: 100%;
  padding-left: 2rem;
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' class='h-6 w-6' fill='none' viewBox='0 0 24 24' stroke='%23999' stroke-width='2'%3E%3Cpath stroke-linecap='round' stroke-linejoin='round' d='M21 21l-6-6m2-5a7 7 0 11-14 0 7 7 0 0114 0z' /%3E%3C/svg%3E");
  background-repeat: no-repeat;
  background-position: 0.625rem 0.75rem;
  background-size: 1rem;
  position: relative;
}

#sidebar > div form input[type="search"].loading {
  background-image: none;
}

#search-spinner {
  width: 1rem;
  height: 1rem;
  background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24'%3E%3Cpath stroke='%23000' strokeLinecap='round' strokeLinejoin='round' strokeWidth='2' d='M20 4v5h-.582m0 0a8.001 8.001 0 00-15.356 2m15.356-2H15M4 20v-5h.581m0 0a8.003 8.003 0 0015.357-2M4.581 15H9' /%3E%3C/svg%3E");
  animation: spin 1s infinite linear;
  position: absolute;
  left: 0.625rem;
  top: 0.75rem;
}

@keyframes spin {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(360deg);
  }
}

#sidebar nav {
  flex: 1;
  overflow: auto;
  padding-top: 1rem;
}

#sidebar nav a span {
  float: right;
  color: #eeb004;
}
#sidebar nav a.active span {
  color: inherit;
}

i {
  color: #818181;
}
#sidebar nav .active i {
  color: inherit;
}

#sidebar ul {
  padding: 0;
  margin: 0;
  list-style: none;
}

#sidebar li {
  margin: 0.25rem 0;
}

#sidebar nav a {
  display: flex;
  align-items: center;
  justify-content: space-between;
  overflow: hidden;

  white-space: pre;
  padding: 0.5rem;
  border-radius: 8px;
  color: inherit;
  text-decoration: none;
  gap: 1rem;
}

#sidebar nav a:hover {
  background: #e3e3e3;
}

#sidebar nav a.active {
  background: hsl(224, 98%, 58%);
  color: white;
}

#sidebar nav a.pending {
  color: hsl(224, 98%, 58%);
}

#detail {
  flex: 1;
  padding: 2rem 4rem;
  width: 100%;
}

#detail.loading {
  opacity: 0.25;
  transition: opacity 200ms;
  transition-delay: 200ms;
}

#contact {
  max-width: 40rem;
  display: flex;
}

#contact h1 {
  font-size: 2rem;
  font-weight: 700;
  margin: 0;
  line-height: 1.2;
}

#contact h1 + p {
  margin: 0;
}

#contact h1 + p + p {
  white-space: break-spaces;
}

#contact h1:focus {
  outline: none;
  color: hsl(224, 98%, 58%);
}

#contact a[href*="twitter"] {
  display: flex;
  font-size: 1.5rem;
  color: #3992ff;
  text-decoration: none;
}
#contact a[href*="twitter"]:hover {
  text-decoration: underline;
}

#contact img {
  width: 12rem;
  height: 12rem;
  background: #c8c8c8;
  margin-right: 2rem;
  border-radius: 1.5rem;
  object-fit: cover;
}

#contact h1 ~ div {
  display: flex;
  gap: 0.5rem;
  margin: 1rem 0;
}

#contact-form {
  display: flex;
  max-width: 40rem;
  flex-direction: column;
  gap: 1rem;
}
#contact-form > p:first-child {
  margin: 0;
  padding: 0;
}
#contact-form > p:first-child > :nth-child(2) {
  margin-right: 1rem;
}
#contact-form > p:first-child,
#contact-form label {
  display: flex;
}
#contact-form p:first-child span,
#contact-form label span {
  width: 8rem;
}
#contact-form p:first-child input,
#contact-form label input,
#contact-form label textarea {
  flex-grow: 2;
}

#contact-form-avatar {
  margin-right: 2rem;
}

#contact-form-avatar img {
  width: 12rem;
  height: 12rem;
  background: hsla(0, 0%, 0%, 0.2);
  border-radius: 1rem;
}

#contact-form-avatar input {
  box-sizing: border-box;
  width: 100%;
}

#contact-form p:last-child {
  display: flex;
  gap: 0.5rem;
  margin: 0 0 0 8rem;
}

#contact-form p:last-child button[type="button"] {
  color: inherit;
}

#zero-state {
  margin: 2rem auto;
  text-align: center;
  color: #818181;
}

#zero-state a {
  color: inherit;
}

#zero-state a:hover {
  color: #121212;
}

#zero-state:before {
  display: block;
  margin-bottom: 0.5rem;
  content: url("data:image/svg+xml,%3Csvg width='50' height='33' viewBox='0 0 50 33' fill='none' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M38.8262 11.1744C37.3975 10.7252 36.6597 10.8766 35.1611 10.7128C32.8444 10.4602 31.9215 9.55475 31.5299 7.22456C31.3108 5.92377 31.5695 4.01923 31.0102 2.8401C29.9404 0.591789 27.4373 -0.416556 24.9225 0.158973C22.7992 0.645599 21.0326 2.76757 20.9347 4.94569C20.8228 7.43263 22.2399 9.5546 24.6731 10.2869C25.8291 10.6355 27.0574 10.8109 28.2646 10.8998C30.4788 11.0613 30.6489 12.292 31.2479 13.3051C31.6255 13.9438 31.9914 14.5731 31.9914 16.4775C31.9914 18.3819 31.6231 19.0112 31.2479 19.6499C30.6489 20.6606 29.9101 21.3227 27.696 21.4865C26.4887 21.5754 25.2581 21.7508 24.1044 22.0994C21.6712 22.834 20.2542 24.9537 20.366 27.4406C20.4639 29.6187 22.2306 31.7407 24.3538 32.2273C26.8686 32.8052 29.3717 31.7945 30.4415 29.5462C31.0032 28.3671 31.3108 27.0312 31.5299 25.7304C31.9238 23.4002 32.8467 22.4948 35.1611 22.2421C36.6597 22.0784 38.2107 22.2421 39.615 21.4443C41.099 20.36 42.4248 18.7328 42.4248 16.4775C42.4248 14.2222 40.9961 11.8575 38.8262 11.1744Z' fill='%23E3E3E3'/%3E%3Cpath d='M15.1991 21.6854C12.2523 21.6854 9.84863 19.303 9.84863 16.3823C9.84863 13.4615 12.2523 11.0791 15.1991 11.0791C18.1459 11.0791 20.5497 13.4615 20.5497 16.3823C20.5497 19.3006 18.1436 21.6854 15.1991 21.6854Z' fill='%23E3E3E3'/%3E%3Cpath d='M5.28442 32.3871C2.36841 32.38 -0.00698992 29.9882 1.54551e-05 27.0652C0.00705187 24.1469 2.39884 21.7715 5.32187 21.7808C8.24022 21.7878 10.6156 24.1796 10.6063 27.1027C10.5992 30.0187 8.20746 32.3941 5.28442 32.3871Z' fill='%23E3E3E3'/%3E%3Cpath d='M44.736 32.387C41.8107 32.4033 39.4096 30.0373 39.3932 27.1237C39.3769 24.1984 41.7428 21.7973 44.6564 21.7808C47.5817 21.7645 49.9828 24.1305 49.9993 27.0441C50.0156 29.9671 47.6496 32.3705 44.736 32.387Z' fill='%23E3E3E3'/%3E%3C/svg%3E%0A");
}

#error-page {
  display: flex;
  flex-direction: column;
  align-items: center;
  justify-content: center;
  width: 100%;
}
```

This tutorial will be creating, reading, searching, updating, and deleting data. A typical web app would probably be talking to an API on your web server, but we're going to use browser storage and fake some network latency to keep this focused. None of this code is relevant to React Router, so just go ahead and copy/paste it all.

###### 👉 **Copy/Paste the tutorial data module this code below into `src/contacts.js`** 

```javascript
import localforage from "localforage";
import { matchSorter } from "match-sorter";
import sortBy from "sort-by";

export async function getContacts(query) {
  await fakeNetwork(`getContacts:${query}`);
  let contacts = await localforage.getItem("contacts");
  if (!contacts) contacts = [];
  if (query) {
    contacts = matchSorter(contacts, query, { keys: ["first", "last"] });
  }
  return contacts.sort(sortBy("last", "createdAt"));
}

export async function createContact() {
  await fakeNetwork();
  let id = Math.random().toString(36).substring(2, 9);
  let contact = { id, createdAt: Date.now() };
  let contacts = await getContacts();
  contacts.unshift(contact);
  await set(contacts);
  return contact;
}

export async function getContact(id) {
  await fakeNetwork(`contact:${id}`);
  let contacts = await localforage.getItem("contacts");
  let contact = contacts.find(contact => contact.id === id);
  return contact ?? null;
}

export async function updateContact(id, updates) {
  await fakeNetwork();
  let contacts = await localforage.getItem("contacts");
  let contact = contacts.find(contact => contact.id === id);
  if (!contact) throw new Error("No contact found for", id);
  Object.assign(contact, updates);
  await set(contacts);
  return contact;
}

export async function deleteContact(id) {
  let contacts = await localforage.getItem("contacts");
  let index = contacts.findIndex(contact => contact.id === id);
  if (index > -1) {
    contacts.splice(index, 1);
    await set(contacts);
    return true;
  }
  return false;
}

function set(contacts) {
  return localforage.setItem("contacts", contacts);
}

// fake a cache so we don't slow down stuff we've already seen
let fakeCache = {};

async function fakeNetwork(key) {
  if (!key) {
    fakeCache = {};
  }

  if (fakeCache[key]) {
    return;
  }

  fakeCache[key] = true;
  return new Promise(res => {
    setTimeout(res, Math.random() * 800);
  });
}
```

All you need in the src folder are `contacts.js`, `main.jsx`, and `index.css`. You can delete anything else (like `App.js` and `assets`, etc.).

###### 👉 **Delete unused files in `src/` so all you have left are these:**

```
src
├── contacts.js
├── index.css
└── main.jsx
```

If your app is running, it might blow up momentarily, just keep going 😋. And with that, we're ready to get started!
## Adding a Router

First thing to do is create a [Browser Router](https://reactrouter.com/en/main/routers/create-browser-router) and configure our first route. This will enable client side routing for our web app.

The `main.jsx` file is the entry point. Open it up and we'll put React Router on the page.

###### 👉 **Create and render a [browser router](https://reactrouter.com/en/main/routers/create-browser-router) in `main.jsx`** 

```jsx
import * as React from "react";
import * as ReactDOM from "react-dom/client";
import {
  createBrowserRouter,
  RouterProvider,
} from "react-router-dom";
import "./index.css";

const router = createBrowserRouter([
  {
    path: "/",
    element: <div>Hello world!</div>,
  },
]);

ReactDOM.createRoot(document.getElementById("root")).render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>
);
```
This first route is what we often call the "root route" since the rest of our routes will render inside of it. It will serve as the root layout of the UI, we'll have nested layouts as we get farther along.

## The Root Route

Let's add the global layout for this app.

###### 👉 **Create `src/routes` and `src/routes/root.jsx`**
```sh
mkdir src/routes
touch src/routes/root.jsx
```
(If you don't want to be a command line nerd, use your editor instead of those commands 🤓)

###### 👉 **Create the root layout component** 
```jsx
export default function Root() {
  return (
    <>
      <div id="sidebar">
        <h1>React Router Contacts</h1>
        <div>
          <form id="search-form" role="search">
            <input
              id="q"
              aria-label="Search contacts"
              placeholder="Search"
              type="search"
              name="q"
            />
            <div
              id="search-spinner"
              aria-hidden
              hidden={true}
            />
            <div
              className="sr-only"
              aria-live="polite"
            ></div>
          </form>
          <form method="post">
            <button type="submit">New</button>
          </form>
        </div>
        <nav>
          <ul>
            <li>
              <a href={`/contacts/1`}>Your Name</a>
            </li>
            <li>
              <a href={`/contacts/2`}>Your Friend</a>
            </li>
          </ul>
        </nav>
      </div>
      <div id="detail"></div>
    </>
  );
}
```
Nothing React Router specific yet, so feel free to copy/paste all of that.
  
###### 👉 **Set `<Root>` as the root route's [`element`](https://reactrouter.com/en/main/route/route#element)** 

```jsx
/* existing imports */
import Root from "./routes/root";

const router = createBrowserRouter([
  {
    path: "/",
    element: <Root />,
  },
]);

ReactDOM.createRoot(document.getElementById("root")).render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>
);
```
The app should look something like this now. It sure is nice having a designer who can also write the CSS, isn't it? (Thank you [Jim](https://blog.jim-nielsen.com/) 🙏).  
![[01 1.webp]]
## Handling Not Found Errors

It's always a good idea to know how your app responds to errors early in the project because we all write far more bugs than features when building a new app! Not only will your users get a good experience when this happens, but it helps you during development as well.

We added some links to this app, let's see what happens when we click them?

###### 👉 **Click one of the sidebar names** 

![screenshot of default React Router error element](https://reactrouter.com/_docs/tutorial/02.webp)

Gross! This is the default error screen in React Router, made worse by our flex box styles on the root element in this app 😂.

Anytime your app throws an error while rendering, loading data, or performing data mutations, React Router will catch it and render an error screen. Let's make our own error page.

###### 👉 **Create an error page component** 

```sh
touch src/error-page.jsx
```

```jsx
import { useRouteError } from "react-router-dom";

export default function ErrorPage() {
  const error = useRouteError();
  console.error(error);

  return (
    <div id="error-page">
      <h1>Oops!</h1>
      <p>Sorry, an unexpected error has occurred.</p>
      <p>
        <i>{error.statusText || error.message}</i>
      </p>
    </div>
  );
}
```

###### 👉 **Set the `<ErrorPage>` as the [`errorElement`](https://reactrouter.com/en/main/route/error-element) on the root route** 

```jsx
/* previous imports */
import ErrorPage from "./error-page";

const router = createBrowserRouter([
  {
    path: "/",
    element: <Root />,
    errorElement: <ErrorPage />,
  },
]);

ReactDOM.createRoot(document.getElementById("root")).render(
  <React.StrictMode>
    <RouterProvider router={router} />
  </React.StrictMode>
);
```
Note that [`useRouteError`](https://reactrouter.com/en/main/hooks/use-route-error) provides the error that was thrown. When the user navigates to routes that don't exist you'll get an [error response](https://reactrouter.com/en/main/utils/is-route-error-response) with a "Not Found" `statusText`. We'll see some other errors later in the tutorial and discuss them more.

For now, it's enough to know that pretty much all of your errors will now be handled by this page instead of infinite spinners, unresponsive pages, or blank screens 🙌
## The Contact Route UI

Instead of a 404 "Not Found" page, we want to actually render something at the URLs we've linked to. For that, we need to make a new route.

###### 👉 **Create the contact route module**

```sh
touch src/routes/contact.jsx
```

###### 👉 **Add the contact component UI** 

It's just a bunch of elements, feel free to copy/paste.

```jsx
import { Form } from "react-router-dom";

export default function Contact() {
  const contact = {
    first: "Your",
    last: "Name",
    avatar: "https://placekitten.com/g/200/200",
    twitter: "your_handle",
    notes: "Some notes",
    favorite: true,
  };

  return (
    <div id="contact">
      <div>
        <img
          key={contact.avatar}
          src={contact.avatar || null}
        />
      </div>

      <div>
        <h1>
          {contact.first || contact.last ? (
            <>
              {contact.first} {contact.last}
            </>
          ) : (
            <i>No Name</i>
          )}{" "}
          <Favorite contact={contact} />
        </h1>

        {contact.twitter && (
          <p>
            <a
              target="_blank"
              href={`https://twitter.com/${contact.twitter}`}
            >
              {contact.twitter}
            </a>
          </p>
        )}

        {contact.notes && <p>{contact.notes}</p>}

        <div>
          <Form action="edit">
            <button type="submit">Edit</button>
          </Form>
          <Form
            method="post"
            action="destroy"
            onSubmit={(event) => {
              if (
                !confirm(
                  "Please confirm you want to delete this record."
                )
              ) {
                event.preventDefault();
              }
            }}
          >
            <button type="submit">Delete</button>
          </Form>
        </div>
      </div>
    </div>
  );
}

function Favorite({ contact }) {
  // yes, this is a `let` for later
  let favorite = contact.favorite;
  return (
    <Form method="post">
      <button
        name="favorite"
        value={favorite ? "false" : "true"}
        aria-label={
          favorite
            ? "Remove from favorites"
            : "Add to favorites"
        }
      >
        {favorite ? "★" : "☆"}
      </button>
    </Form>
  );
}
```
Now that we've got a component, let's hook it up to a new route.

###### 👉 **Import the contact component and create a new route**

```
/* existing imports */
import Contact from "./routes/contact";

const router = createBrowserRouter([
  {
    path: "/",
    element: <Root />,
    errorElement: <ErrorPage />,
  },
  {
    path: "contacts/:contactId",
    element: <Contact />,
  },
]);

/* existing code */
```

Now if we click one of the links or visit `/contacts/1` we get our new component!

![contact route rendering without the parent layout](https://reactrouter.com/_docs/tutorial/04.webp)

However, it's not inside of our root layout 😠

## Nested Routes

We want the contact component to render _inside_ of the `<Root>` layout like this.

![](https://reactrouter.com/_docs/tutorial/05.webp)

We do it by making the contact route a _child_ of the root route.

###### 👉 **Move the contacts route to be a child of the root route**

```
const router = createBrowserRouter([
  {
    path: "/",
    element: <Root />,
    errorElement: <ErrorPage />,
    children: [
      {
        path: "contacts/:contactId",
        element: <Contact />,
      },
    ],
  },
]);
```

You'll now see the root layout again but a blank page on the right. We need to tell the root route _where_ we want it to render its child routes. We do that with [`<Outlet>`](https://reactrouter.com/en/main/components/outlet).

Find the `<div id="detail">` and put an outlet inside

###### 👉 **Render an [`<Outlet>`](https://reactrouter.com/en/main/components/outlet)**

```
import { Outlet } from "react-router-dom";

export default function Root() {
  return (
    <>
      {/* all the other elements */}
      <div id="detail">
        <Outlet />
      </div>
    </>
  );
}
```

## Client Side Routing

You may or may not have noticed, but when we click the links in the sidebar, the browser is doing a full document request for the next URL instead of using React Router.

Client side routing allows our app to update the URL without requesting another document from the server. Instead, the app can immediately render new UI. Let's make it happen with [`<Link>`](https://reactrouter.com/en/main/components/link).

###### 👉 **Change the sidebar `<a href>` to `<Link to>`**

```
import { Outlet, Link } from "react-router-dom";

export default function Root() {
  return (
    <>
      <div id="sidebar">
        {/* other elements */}

        <nav>
          <ul>
            <li>
              <Link to={`contacts/1`}>Your Name</Link>
            </li>
            <li>
              <Link to={`contacts/2`}>Your Friend</Link>
            </li>
          </ul>
        </nav>

        {/* other elements */}
      </div>
    </>
  );
}
```

You can open the network tab in the browser devtools to see that it's not requesting documents anymore.
## Loading Data

URL segments, layouts, and data are more often than not coupled (tripled?) together. We can see it in this app already:

|URL Segment|Component|Data|
|---|---|---|
|/|`<Root>`|list of contacts|
|contacts/:id|`<Contact>`|individual contact|

Because of this natural coupling, React Router has data conventions to get data into your route components easily.

There are two APIs we'll be using to load data, [`loader`](https://reactrouter.com/en/main/route/loader) and [`useLoaderData`](https://reactrouter.com/en/main/hooks/use-loader-data). First we'll create and export a loader function in the root module, then we'll hook it up to the route. Finally, we'll access and render the data.

###### 👉 **Export a loader from `root.jsx`** 
```jsx
import { Outlet, Link } from "react-router-dom";
import { getContacts } from "../contacts";

export async function loader() {
  const contacts = await getContacts();
  return { contacts };
}
```

###### 👉 **Configure the loader on the route** 
```jsx
/* other imports */
import Root, { loader as rootLoader } from "./routes/root";

const router = createBrowserRouter([
  {
    path: "/",
    element: <Root />,
    errorElement: <ErrorPage />,
    loader: rootLoader,
    children: [
      {
        path: "contacts/:contactId",
        element: <Contact />,
      },
    ],
  },
]);
```

###### 👉 **Access and render the data** 
```jsx
import {
  Outlet,
  Link,
  useLoaderData,
} from "react-router-dom";
import { getContacts } from "../contacts";

/* other code */

export default function Root() {
  const { contacts } = useLoaderData();
  return (
    <>
      <div id="sidebar">
        <h1>React Router Contacts</h1>
        {/* other code */}

        <nav>
          {contacts.length ? (
            <ul>
              {contacts.map((contact) => (
                <li key={contact.id}>
                  <Link to={`contacts/${contact.id}`}>
                    {contact.first || contact.last ? (
                      <>
                        {contact.first} {contact.last}
                      </>
                    ) : (
                      <i>No Name</i>
                    )}{" "}
                    {contact.favorite && <span>★</span>}
                  </Link>
                </li>
              ))}
            </ul>
          ) : (
            <p>
              <i>No contacts</i>
            </p>
          )}
        </nav>

        {/* other code */}
      </div>
    </>
  );
}
```
That's it! React Router will now automatically keep that data in sync with your UI. We don't have any data yet, so you're probably getting a blank list like this:

![](https://reactrouter.com/_docs/tutorial/06.webp)

## Data Writes + HTML Forms

We'll create our first contact in a second, but first let's talk about HTML.

React Router emulates HTML Form navigation as the data mutation primitive, according to web development before the JavaScript cambrian explosion. It gives you the UX capabilities of client rendered apps with the simplicity of the "old school" web model.

While unfamiliar to some web developers, HTML forms actually cause a navigation in the browser, just like clicking a link. The only difference is in the request: links can only change the URL while forms can also change the request method (GET vs POST) and the request body (POST form data).

Without client side routing, the browser will serialize the form's data automatically and send it to the server as the request body for POST, and as URLSearchParams for GET. React Router does the same thing, except instead of sending the request to the server, it uses client side routing and sends it to a route [`action`](https://reactrouter.com/en/main/route/action).

We can test this out by clicking the "New" button in our app. The app should blow up because the Vite server isn't configured to handle a POST request (it sends a 404, though it should probably be a 405 🤷).

Instead of sending that POST to the Vite server to create a new contact, let's use client side routing instead.
## Creating Contacts

We'll create new contacts by exporting an `action` in our root route, wiring it up to the route config, and changing our `<form>` to a React Router [`<Form>`](https://reactrouter.com/en/main/components/form).

###### 👉 **Create the action and change `<form>` to `<Form>`**

```jsx
import {
  Outlet,
  Link,
  useLoaderData,
  Form,
} from "react-router-dom";
import { getContacts, createContact } from "../contacts";

export async function action() {
  const contact = await createContact();
  return { contact };
}

/* other code */

export default function Root() {
  const { contacts } = useLoaderData();
  return (
    <>
      <div id="sidebar">
        <h1>React Router Contacts</h1>
        <div>
          {/* other code */}
          <Form method="post">
            <button type="submit">New</button>
          </Form>
        </div>

        {/* other code */}
      </div>
    </>
  );
}
```

###### 👉 **Import and set the action on the route** 
```jsx
/* other imports */

import Root, {
  loader as rootLoader,
  action as rootAction,
} from "./routes/root";

const router = createBrowserRouter([
  {
    path: "/",
    element: <Root />,
    errorElement: <ErrorPage />,
    loader: rootLoader,
    action: rootAction,
    children: [
      {
        path: "contacts/:contactId",
        element: <Contact />,
      },
    ],
  },
]);
```
That's it! Go ahead and click the "New" button and you should see a new record pop into the list 🥳

![](https://reactrouter.com/_docs/tutorial/08.webp)

The `createContact` method just creates an empty contact with no name or data or anything. But it does still create a record, promise!

> 🧐 Wait a sec ... How did the sidebar update? Where did we call the `action`? Where's the code to refetch the data? Where are `useState`, `onSubmit` and `useEffect`?!

This is where the "old school web" programming model shows up. As we discussed earlier, [`<Form>`](https://reactrouter.com/en/main/components/form) prevents the browser from sending the request to the server and sends it to your route `action` instead. In web semantics, a POST usually means some data is changing. By convention, React Router uses this as a hint to automatically revalidate the data on the page after the action finishes. That means all of your `useLoaderData` hooks update and the UI stays in sync with your data automatically! Pretty cool.