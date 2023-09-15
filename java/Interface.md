 [[Class]]
## What Is an Interface?
As you've already learned, objects define their interaction with the outside world through the methods that they expose. Methods form the object's _interface_ with the outside world; the buttons on the front of your television set, for example, are the interface between you and the electrical wiring on the other side of its plastic casing. You press the "power" button to turn the television on and off.

In its most common form, an interface is a group of related methods with empty bodies. A bicycle's behavior, if specified as an interface, might appear as follows:
```java
interface Bicycle {
	void changeCadence(int newValue);
	void changeGear(int increment);
	void applyBrakes(int decrement);
}
```
To implement this interface, the name of your class would change (to a particular brand of bicycle, for example, such as `ACMEBicycle`), and you'd use the `implements` keyword in the class declaration:
```java
class ACMEBicycle implements Bicycle {
	int cadence = 0;
	int speed = 0;
	int gear = 0;
	
	void changeCadence(int newValue) {
		cadence = newValue;
	}
	
	void changeGear(int newValue) {
		gear = newValue;
	}
	
	void speedUp(int increment) {
		speed += increment;
	}
	
	void applyBrakes(int decrement) {
		speed -= decrement;
	}
	
	void printStates() {
		System.out.println(
			"cadence:" + cadence + "\n" +
			"speed:" + speed + "\n" +
			"gear:" + gear + "\n"
		);
	}
}
```
Implementing an interface allows a class to become more formal about the behavior it promises to provide. Interfaces form a contract between the class and the outside world, and this contract is enforced at build time by the compiler. If your class claims to implement an interface, all methods defined by that interface must appear in its source code before the class will successfully compile.

---

**Note:** To actually compile the `ACMEBicycle` class, you'll need to add the `public` keyword to the beginning of the implemented interface methods. You'll learn the reasons for this later in the lessons on [Classes and Objects](https://docs.oracle.com/javase/tutorial/java/javaOO/index.html) and [Interfaces and Inheritance](https://docs.oracle.com/javase/tutorial/java/IandI/index.html).

---
