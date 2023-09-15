 [[Inheritence]] [[Interface]] [[Package]]
In the real world, you'll often find many individual objects all of the same kind. There may be thousands of other bicycles in existence, all of the same make and model. Each bicycle was built from the same set of blueprints and therefore contains the same components. In object-oriented terms, we say that your bicycle is an _instance_ of the _class of objects_ known as bicycles. A _class_ is the blueprint from which individual objects are created.
The following `Bicycle` class is one possible implementation of a bicycle:
```java
class Bicycle {
	int cadence = 0;
	int speed = 0;
	int gear = 1;
	
	// default constructor when no value for the constructor is specified
	public Bicycle() {};
	
	public Bicycle(int cadence, int speed, int gear) {
		this.cadence = cadence;
		this.speed = speed;
		this.gear = gear;
	};
	
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
			"cadence:" + this.cadence + "\n" +
			"speed:" + this.speed + "\n" +
			"gear:" + this.gear + "\n"
		);
	}
}
```
The syntax of the Java programming language will look new to you, but the design of this class is based on the previous discussion of bicycle objects. The fields `cadence`, `speed`, and `gear` represent the object's state, and the methods (`changeCadence`, `changeGear`, `speedUp` etc.) define its interaction with the outside world.

You may have noticed that the `Bicycle` class does not contain a `main` method. That's because it's not a complete application; it's just the blueprint for bicycles that might be _used_ in an application. The responsibility of creating and using new `Bicycle` objects belongs to some other class in your application.

Here's a `BicycleDemo` class that creates two separate `Bicycle` objects and invokes their methods:
```java
import Bicycle;

class BicycleDemo {
	public static void main(String[] args) {
		Bicycle bike1 = new Bicycle();
		Bicycle bike2 = new Bicycle();
		
		bike1.changeCadence(50);
		bike1.speedUp(10);
		bike1.changeGear(2);
		bike1.printStates();
		
		bike2.changeCadence(50);
		bike2.speedUp(10);
		bike2.changeGear(2);
		bike2.changeCadence(40);
		bike2.speedUp(10);
		bike2.changeGear(3);
		bike2.printStates();
	}
}
```
