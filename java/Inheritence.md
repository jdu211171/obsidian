 [[Class]] [[Interface]]
## What Is Inheritance?
Different kinds of objects often have a certain amount in common with each other. Mountain bikes, road bikes, and tandem bikes, for example, all share the characteristics of bicycles (current speed, current pedal cadence, current gear). Yet each also defines additional features that make them different: tandem bicycles have two seats and two sets of handlebars; road bikes have drop handlebars; some mountain bikes have an additional chain ring, giving them a lower gear ratio.

Object-oriented programming allows classes to _inherit_ commonly used state and behavior from other classes. In this example, `Bicycle` now becomes the _superclass_ of `MountainBike`, `RoadBike`, and `TandemBike`. In the Java programming language, each class is allowed to have one direct superclass, and each superclass has the potential for an unlimited number of _subclasses_:

The syntax for creating a subclass is simple. At the beginning of your class declaration, use the `extends` keyword, followed by the name of the class to inherit from:
```java
class MountainBike extends Bicycle {
    int suspension;

    public MountainBike(int startCadence, int startSpeed, int startGear, int suspension) {
        super(startCadence, startSpeed, startGear); // Call the constructor of the superclass
        this.suspension = suspension;
    }

    void setSuspension(int newValue) {
        suspension = newValue;
    }

    void printStates() {
        super.printStates(); // Call the printStates() method of the superclass
        System.out.println("suspension:" + this.suspension + "\n");
    }
}
```
This gives `MountainBike` all the same fields and methods as `Bicycle`, yet allows its code to focus exclusively on the features that make it unique. This makes code for your subclasses easy to read. However, you must take care to properly document the state and behavior that each superclass defines, since that code will not appear in the source file of each subclass.
