Java has two categories of types: **primitive types** and **reference types**. Primitive types are the basic data types that are predefined by the language and have a fixed size and range, such as `int`, `double`, `boolean`, and `char`. Reference types are the types that refer to objects or arrays, which are dynamically created and can have variable size and properties.
```java
// byte is an 8-bit signed integer that can store values from -128 to 127
byte b = 10;

// short is a 16-bit signed integer that can store values from -32768 to 32767
short s = 1_000;

// int is a 32-bit signed integer that can store values from -2147483648 to 2147483647
int i = 1_000_000;

// long is a 64-bit signed integer that can store values from -9223372036854775808 to 9223372036854775807
long l = 1_000_000_000L; // when declaring long variable L suffix should be added
l <<= 2; // left shift the value by 2 bits (multiply by 4)

// float is a 32-bit floating point number that can store fractional values with about 6-7 decimal digits of precision
float f = 3.14f; // when declaring float variable f suffix should be added

// double is a 64-bit floating point number that can store fractional values with about 15 decimal digits of precision
double d = Math.PI;
d -= Math.E; // subtract another constant from the Math class (Euler's number)

// char is a 16-bit unsigned integer that can store single character from the Unicode character set
char c = 'A';
c++; // increment the value by one (move to the next character in Unicode)

// boolean is a 1-bit logical type that can store only two values: true or false
boolean b = true;
b != b; // negate the value (flip it to false)
b = b && true; // perform a logical AND operation with true (result will be false)
```