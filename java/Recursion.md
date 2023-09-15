A recursive function is a function that calls itself, either directly or indirectly, until a base case or a stopping condition is reached. Recursion can be used to solve problems that can be broken down into smaller and simpler subproblems of the same type.

- Factorial function
```java
public static int factorial(int n) {
	if (n == 0 || n == 1) return 1;
	else return n * factorial(n - 1);
}
```

-   Printing a series of numbers in reverse order:
```java
public static void printReverse(int n) {
	if (n == 1) {
		System.out.println(n);
		return;
	}
	System.out.println(n);
	printReverse(n - 1);
}
```

- Summing a series of numbers:
```java
public static int sum(int n) {
	if (n == 0) return 0;
	return n + sum(n - 1);
}
```

- Calculating the Fibonacci series:
```java
public static int fibonacci(int n) {
	if (n == 0 || n == 1) return n;
	return fibonacci(n - 1) + fibonacci(n - 2);
}
```

- Checking if a string is a palindrome:
```java
public static boolean isPalindrome(String s) {
	if(s.length() == 0 || s.length() == 1) return true;
	return s.charAt(0) == s.charAt(s.length() - 1) && isPalindrome(s.substring(1, s.length() - 1));
}
```