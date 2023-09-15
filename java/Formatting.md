If you wanna learn about here is link: [[Scanning]]
## The `format` Method
The `format` method formats multiple arguments based on a _format string_. The format string consists of static text embedded with _format specifiers_; except for the format specifiers, the format string is output unchanged.
Format strings support many features. In this tutorial, we'll just cover some basics. For a complete description, see [`format string syntax`](https://docs.oracle.com/javase/8/docs/api/java/util/Formatter.html#syntax) in the API specification.
The `Root2` example formats two values with a single `format` invocation:
```java
public class Root2{
	public static void main(String[] args){
		int i = 2;
		double r = Math.sqrt(i);
		
		System.out.printf("The square root of %d is %f.%n", i, r); // %n is platform-independent newline character
	}
}
```
Like the three used in this example, all format specifiers begin with a `%` and end with a 1- or 2-character _conversion_ that specifies the kind of formatted output being generated. The three conversions used here are:

- `d` formats an _integer_ value as a decimal value.
- `f` formats a _floating point value_ as a decimal value.
- `n` outputs a platform-specific _line terminator_.

Here are some other conversions:

- `x` formats an _integer as a hexadecimal_ value.
- `s` formats any value as a _string_.
- `tB` formats an integer as a locale-specific _month name_.

There are many other conversions.

In addition to the conversion, a format specifier can contain several additional elements that further customize the formatted output. Here's an example, `Format`, that uses every possible kind of element.
```java
public class Format{
	public static void main(String args[]){
		System.out.format("%f, %1$+020.10f %n", Math.PI);
		System.out.format("%.2f%n", 2.145);
	}
}
```
Here's the output:
3.141593, +00000003.1415926536

- `%`         Begin Format Specifier
- `1$`       Argument Index
- `+0`       Flags
- `.10`     Precision
- `f`         Conversion

The elements must appear in the order shown. Working from the right, the optional elements are:

- **Precision**. For floating point values, this is the mathematical precision of the formatted value. For `s` and other general conversions, this is the maximum width of the formatted value; the value is right-truncated if necessary.
- **Width**. The minimum width of the formatted value; the value is padded if necessary. By default the value is left-padded with blanks.
- **Flags** specify additional formatting options. In the `Format` example, the `+` flag specifies that the number should always be formatted with a sign, and the `0` flag specifies that `0` is the padding character. Other flags include `-` (pad on the right) and `,` (format number with locale-specific thousands separators). Note that some flags cannot be used with certain other flags or with certain conversions.
- The **Argument Index** allows you to explicitly match a designated argument. You can also specify `<` to match the same argument as the previous specifier. Thus the example could have said: `System.out.format("%f, %<+020.10f %n", Math.PI);`

