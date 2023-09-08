With the knowledge you now have of the basics of the Java programming language, you can learn to write your own classes. In this lesson, you will find information about defining your own classes, including declaring member variables, methods, and constructors.

You will learn to use your classes to create objects, and how to use the objects you create.

This lesson also covers nesting classes within other classes, and enumerations

## [[Classes]]

This section shows you the anatomy of a class, and how to declare fields, methods, and constructors.
## Objects

This section covers creating and using objects. You will learn how to instantiate an object, and, once instantiated, how to use the `dot` operator to access the object's instance variables and methods.

A typical Java program creates many objects, which as you know, interact by invoking methods. Through these object interactions, a program can carry out various tasks, such as implementing a GUI, running an animation, or sending and receiving information over a network. Once an object has completed the work for which it was created, its resources are recycled for use by other objects.

Here's a small program, called [`CreateObjectDemo`](https://docs.oracle.com/javase/tutorial/java/javaOO/examples/CreateObjectDemo.java), that creates three objects: one [`Point`](https://docs.oracle.com/javase/tutorial/java/javaOO/examples/Point.java) object and two [`Rectangle`](https://docs.oracle.com/javase/tutorial/java/javaOO/examples/Rectangle.java) objects. You will need all three source files to compile this program.
```java
public class CreateObjectDemo {

    public static void main(String[] args) {
		
        // Declare and create a point object and two rectangle objects.
        Point originOne = new Point(23, 94);
        Rectangle rectOne = new Rectangle(originOne, 100, 200);
        Rectangle rectTwo = new Rectangle(50, 100);
		
        // display rectOne's width, height, and area
        System.out.println("Width of rectOne: " + rectOne.width);
        System.out.println("Height of rectOne: " + rectOne.height);
        System.out.println("Area of rectOne: " + rectOne.getArea());
		
        // set rectTwo's position
        rectTwo.origin = originOne;
		
        // display rectTwo's position
        System.out.println("X Position of rectTwo: " + rectTwo.origin.x);
        System.out.println("Y Position of rectTwo: " + rectTwo.origin.y);
		
        // move rectTwo and display its new position
        rectTwo.move(40, 72);
        System.out.println("X Position of rectTwo: " + rectTwo.origin.x);
        System.out.println("Y Position of rectTwo: " + rectTwo.origin.y);
    }
}
```

This program creates, manipulates, and displays information about various objects. Here's the output:

	Width of rectOne: 100
	Height of rectOne: 200
	Area of rectOne: 20000
	X Position of rectTwo: 23
	Y Position of rectTwo: 94
	X Position of rectTwo: 40
	Y Position of rectTwo: 72

The following three sections use the above example to describe the life cycle of an object within a program. From them, you will learn how to write code that creates and uses objects in your own programs. You will also learn how the system cleans up after an object when its life has ended.

## [More on Classes](https://docs.oracle.com/javase/tutorial/java/javaOO/more.html)

This section covers more aspects of classes that depend on using object references and the `dot` operator that you learned about in the preceding section: returning values from methods, the `this` keyword, class vs. instance members, and access control.

## [Nested Classes](https://docs.oracle.com/javase/tutorial/java/javaOO/nested.html)

Static nested classes, inner classes, anonymous inner classes, local classes, and lambda expressions are covered. There is also a discussion on when to use which approach.

## [Enum Types](https://docs.oracle.com/javase/tutorial/java/javaOO/enum.html)

This section covers enumerations, specialized classes that allow you to define and use sets of constants.