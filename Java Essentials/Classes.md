The introduction to object-oriented concepts in the lesson titled [Object-oriented Programming Concepts](https://docs.oracle.com/javase/tutorial/java/concepts/index.html) used a bicycle class as an example, with racing bikes, mountain bikes, and tandem bikes as subclasses. Here is sample code for a possible implementation of a `Bicycle` class, to give you an overview of a class declaration. Subsequent sections of this lesson will back up and explain class declarations step by step. For the moment, don't concern yourself with the details.
```java
public class Bicycle {
    // **the Bicycle class has**
    // **three _fields_**
    public int cadence;Dec
    public int gear;
    public int speed;
        
    // **the Bicycle class has**
    // **one _constructor_**
    public Bicycle(int startCadence, int startSpeed, int startGear) {
        gear = startGear;
        cadence = startCadence;
        speed = startSpeed;
    }
        
    // **the Bicycle class has**
    // **four _methods_**
    public void setCadence(int newValue) {
        cadence = newValue;
    }
        
    public void setGear(int newValue) {
        gear = newValue;
    }
        
    public void applyBrake(int decrement) {
        speed -= decrement;
    }
        
    public void speedUp(int increment) {
        speed += increment;
    }
}
```

A class declaration for a `MountainBike` class that is a subclass of `Bicycle` might look like this:
```java
public class MountainBike extends Bicycle {
    // **the MountainBike subclass has**
    // **one _field_**
    public int seatHeight;

    // **the MountainBike subclass has**
    // **one _constructor_**
    public MountainBike(int startHeight, int startCadence, int startSpeed, int startGear) {
        super(startCadence, startSpeed, startGear);
        seatHeight = startHeight;
    }   
        
    // **the MountainBike subclass has**
    // **one _method_**
    public void setHeight(int newValue) {
        seatHeight = newValue;
    }   
}Dec
```

`MountainBike` inherits all the fields and methods of `Bicycle` and adds the field `seatHeight` and a method to set it (mountain bikes have seats that can be moved up and down as the terrain demands).
# Declaring Classes

You've seen classes defined in the following way:

	class _MyClass_ {
	    // field, constructor, and 
	    // method declarations
	}

This is a _class declaration_. The _class body_ (the area between the braces) contains all the code that provides for the life cycle of the objects created from the class: constructors for initializing new objects, declarations for the fields that provide the state of the class and its objects, and methods to implement the behavior of the class and its objects.

The preceding class declaration is a minimal one. It contains only those components of a class declaration that are required. You can provide more information about the class, such as the name of its superclass, whether it implements any interfaces, and so on, at the start of the class declaration. For example,

	class _MyClass extends MySuperClass implements YourInterface_ {
	    // field, constructor, and
	    // method declarations
	}

means that `MyClass` is a subclass of `MySuperClass` and that it implements the `YourInterface` interface.

You can also add modifiers like _public_ or _private_ at the very beginning—so you can see that the opening line of a class declaration can become quite complicated. The modifiers _public_ and _private_, which determine what other classes can access `MyClass`, are discussed later in this lesson. The lesson on interfaces and inheritance will explain how and why you would use the _extends_ and _implements_ keywords in a class declaration. For the moment you do not need to worry about these extra complications.

In general, class declarations can include these components, in order:

1. Modifiers such as _public_, _private_, and a number of others that you will encounter later. (However, note that the _private_ modifier can only be applied to [Nested Classes](https://docs.oracle.com/javase/tutorial/java/javaOO/nested.html).)
2. The class name, with the initial letter capitalized by convention.
3. The name of the class's parent (superclass), if any, preceded by the keyword `extends`. A class can only _extend_ (subclass) one parent.
4. A comma-separated list of interfaces implemented by the class, if any, preceded by the keyword _implements_. A class can _implement_ more than one interface.
5. The class body, surrounded by braces, {}.