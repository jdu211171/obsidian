If you wanna learn about here is link: [[Formatting]]
## Breaking Input into Tokens
Objects of type [`Scanner`](https://docs.oracle.com/javase/8/docs/api/java/util/Scanner.html) are useful for breaking down formatted input into tokens and translating individual tokens according to their data type.

By default, a scanner uses white space to separate tokens. (White space characters include blanks, tabs, and line terminators. For the full list, refer to the documentation for [`Character.isWhitespace`](https://docs.oracle.com/javase/8/docs/api/java/lang/Character.html#isWhitespace-char-).) To see how scanning works, let's look at `ScanXan`, a program that reads the individual words in `xanadu.txt` and prints them out, one per line.
```java
import java.io.*;
import java.util.Scanner;

public class ScanXan{
	public static void main(String[] args) throws IOException {
		Scanner s = null;
		
		try{
			s = new Scanner(new BufferedReader(new FileReader("xanadu.txt")));
			s.useDelimiter(",\\s*");
			while(s.hasNext()){
				System.out.println(s.next());
			}
		} finally {
			if (s != null){
				s.close();
			}
		}
	}
}
```
To use a different token separator, invoke `useDelimiter()`, specifying a regular expression. For example, if you want separate every sentence with comma you wanna write this:
`s.useDelimiter(",\\s*");` 
If you wanna seperate every sentence, you wanna write this:
`s.useDelimiter("(?<=[.!?])\\s+");`
## Translating Individual Tokens
The `ScanXan` example treats all input tokens as simple `String` values. `Scanner` also supports tokens for all of the Java language's primitive types (except for `char`), as well as `BigInteger` and `BigDecimal`. Also, numeric values can use thousands separators. Thus, in a `US` locale, `Scanner` correctly reads the string "32,767" as representing an integer value.

We have to mention the locale, because thousands separators and decimal symbols are locale specific. So, the following example would not work correctly in all locales if we didn't specify that the scanner should use the `US` locale. That's not something you usually have to worry about, because your input data usually comes from sources that use the same locale as you do. But this example is part of the Java Tutorial and gets distributed all over the world.

The `ScanSum` example reads a list of `double` values and adds them up. Here's the source:
```java
import java.io.FileReader;
import java.io.BufferedReader;
import java.io.IOException;
import java.util.Scanner;
import java.util.Locale;

public class ScanSum{
	public static void main(String[] args) throws IOException {
		Scanner s = null;
		double sum = 0;
		
		try{
			s = new Scanner(new BufferedReader(new FileReader("usnumbers.txt")));
			s.useLocale(Locale.US);
			
			while (s.hasNext()){
				if (s.hasNextDouble()){
					sum += s.nextDouble();
				} else {
					s.next();
				}
			}
		} finally {
				if (s != null) s.close();
			}
		System.out.println(sum);
	}
}
```
The output string is "1032778.74159". The period will be a different character in some locales, because `System.out` is a `PrintStream` object, and that class doesn't provide a way to override the default locale. We could override the locale for the whole program — or we could just use formatting, as described in the next topic, [Formatting](https://docs.oracle.com/javase/tutorial/essential/io/formatting.html).