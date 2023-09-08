Programs use _byte streams_ to perform input and output of 8-bit bytes. 
## Using Byte Streams
`CopyBytes` seems like a normal program, but it actually represents a kind of low-level I/O that you should avoid. Since `xanadu.txt` contains character data, the best approach is to use [character streams](https://docs.oracle.com/javase/tutorial/essential/io/charstreams.html), as discussed in the next section. There are also streams for more complicated data types. Byte streams should only be used for the most primitive I/O.

So why talk about byte streams? Because all other stream types are built on byte streams.
```java
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;

public class CopyBytes {
	public static void main(String[] args) {
		FileInputStream in = null;
		FileOutputStream out = null;

		try {
			in = new FileInputStream("inputFileName.txt");
			out = new FileOutputStream("outputFileName.txt");
			int c;
			
			while ((c = in.read()) != -1){
				out.write(c);
			}
		} finally {
			if (in != null) in.close();
			if (out != null) out.close();
		}
	}
}
```
### Always Close Streams
Closing a stream when it's no longer needed is very important - so important that `CopyBytes` uses a finally block to guarantee that both streams will be closed even if an error occurs. This practice helps avoid serious resource leaks.


## Using Character Streams
As with byte streams, there are character stream classes that specialize in file I/O: [`FileReader`](https://docs.oracle.com/javase/8/docs/api/java/io/FileReader.html) and [`FileWriter`](https://docs.oracle.com/javase/8/docs/api/java/io/FileWriter.html). The `CopyCharacters` example illustrates these classes.
```java
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class CopyCharacters{
	public static void main(String[] args) throws IOException{
		FileReader inputStream = null;
		FileWriter outputStream = null;
		
		try {
			inputStream = new FileReader("inputFileName.txt");
			outputStream = new FileWriter("outputFileName.txt");
			int c;
			while ((c = inputStream.read()) != -1){
				outputStream.write(c);
			}
		} finally {
			if (inputStream != null) inputStream.close();
			if (outputStream != null) outputStream.close();
		}
	}
}
```
## Line Oriented I/O
Character I/O usually occurs in bigger units than single characters. One common unit is the line: a string of characters with a line terminator at the end. A line terminator can be a carriage-return/line-feed sequence (`"\r\n"`), a single carriage-return (`"\r"`), or a single line-feed (`"\n"`).
Let's modify the `CopyCharacters` example to use line-oriented I/O. To do this, we have to use two classes we haven't seen before, [`BufferedReader`](https://docs.oracle.com/javase/8/docs/api/java/io/BufferedReader.html) and [`PrintWriter`](https://docs.oracle.com/javase/8/docs/api/java/io/PrintWriter.html).
```java
import java.io.FileReader;
import java.io.FileWriter;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.io.IOException;

public class CopyLines{
	public static void main(String[] args) throws IOException {
		BufferedReader inputStream = null;
		PrintWriter outputStream = null;
		
		try {
			inputStream = new BufferedReader(new FileReader("inputFileName.txt"));
			outputStream = new PrintWriter(new FileWriter("outputFileName.txt"));
			
			String l;
			while ((l = inputStream.readLine()) != null){
				outputStream.println(l);
			}
		} finally {
			if (inputStream != null) inputStream.close();
			if (outputStream != null) outputStream.close();
		}
	}
}
```
## Buffered Streams
Most of the examples we've seen so far use unbuffered __I/O__. This means each read or write request is handled directly by the underlying OS. This can make a program much less efficient, since each such request often triggers disk access, network activity, or some other operation that is relatively expensive.
To reduce this kind of overhead, the Java platform implements _buffered_ __I/O__ streams. Buffered input streams read data from a memory area known as a _buffer_; the native input API is called only when the buffer is empty. Similarly, buffered output streams write data to a buffer, and the native output API is called only when the buffer is full.
A program can convert an unbuffered stream into a buffered stream using the wrapping idiom we've used several times now, where the unbuffered stream object is passed to the constructor for a buffered stream class. Here's how you might modify the constructor invocations in the `CopyCharacters` example to use buffered I/O:

```java
inputStream = new BufferedReader(new FileReader("inputFileName.txt"));
inputStream = new BufferedWriter(new FileWriter("outputFileName.txt"));
```
There are four buffered stream classes used to wrap unbuffered streams: [`BufferedInputStream`](https://docs.oracle.com/javase/8/docs/api/java/io/BufferedInputStream.html) and [`BufferedOutputStream`](https://docs.oracle.com/javase/8/docs/api/java/io/BufferedOutputStream.html) create buffered byte streams, while [`BufferedReader`](https://docs.oracle.com/javase/8/docs/api/java/io/BufferedReader.html) and [`BufferedWriter`](https://docs.oracle.com/javase/8/docs/api/java/io/BufferedWriter.html) create buffered character streams.
### Flushing Buffered Streams
It often makes sense to write out a buffer at critical points, without waiting for it to fill. This is known as flushing the buffer.
Some buffered output classes support autoflush, specified by an optional constructor argument. When autoflush is enabled, certain key events cause the buffer to be flushed. For example, an autoflush `PrintWriter` object flushes the buffer on every invocation of println on format. See [Formatting](https://docs.oracle.com/javase/tutorial/essential/io/formatting.html) for more on these methods.
To flush a stream manually, invoke its `flush` method. The `flush` method is valid on any output stream, but has no effect unless the stream is buffered.
For example for this, we can look at this code:
```java
import java.io.*;

public class FlushExample{
	public static void main(String[]){
		File file = new File("~/Programming/java/output.txt");
		
		try{
			FileWriter writer = new FileWriter(file);
			BufferedWriter bufferedWriter = new BufferedWriter(writer);
			
			bufferedWriter.write("This is a sample text.");
			bufferedWriter.flush();
			bufferedWriter.write("This is another sample text.");
			bufferedWriter.close();
			
			FileReader reader = new FileReader(file);
			BufferedReader bufferedReader = new BufferedWriter(reader);
			
			String line = bufferedReader.readLine();
			System.out.println(line);
			bufferedReader.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
```