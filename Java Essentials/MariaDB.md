To connect to a MariaDB database in Java, you need to use a JDBC driver that supports MariaDB. [You can install MariaDB Connector/J from the AUR package **mariadb-jdbc** from here](https://wiki.archlinux.org/title/JDBC_and_MySQL). You also need to specify the connection URL, username and password for your database. For example:
```java
// Load the driver
Class.forName("org.mariadb.jdbc.Driver");

// Establish the connection
String url = "jdbc:mariadb://localhost:3306/mydb";
String user = "root";
String password = "";
Connection conn = DriverManager.getConnection(url, user, password);

// Use connection
// ...

// Close connection
conn.close();
```

Here are some common tasks you can do with JDBC:

- Create a table:
```java
Statement stmt = conn.createStatement();
stmt.executeUpdate("CREATE TABLE books (id INT PRIMARY KEY, title VARCHAR(100), author VARCHAR(50))");
stmt.close();
```

- Insert some data:
```java
PreparedStatement pstmt = conn.prepareStatement("INSERT INTO books VALUES (?,?,?)");
pstmt.setInt(1, 1); // set the first parameter to 1
pstmt.setString(2, "The Hitchhiker's Guide to the Galaxy"); // set the second parameter to the book title
pstmt.setString(3, "Douglas Adams"); // set the third parameter to the author name
pstmt.executeUpdate();
pstmt.close();
```

- Query some data:
```java
Statement stmt = conn.createStatement();
ResultSet rs = stmt.executeQuery("SELECT * FROM books"); // get the result
while (rs.next()) { // loop through the rows
	int id = rs.getInt("id"); // get the id column value
	String title = rs.getString("title"); // get the title column value
	String author = rs.getString("author"); // get the author column value
	System.out.println(id + " - " + title + " by " + author);
}
rs.close();
stmt.close();
```

- Update some data:
```java
PreparedStatement pstmt = conn.prepareStatement("UPDATE books SET title = ? WHERE id = ?");
pstmt.setString(1, "The Restaurant at the End of the Universe"); // set the new title
pstmt.setInt(2, 1); // set the id of the book to update
pstmt.executeUpdate(); // execute the statement
pstmt.close();
```

- Delete some data:
```java
PreparedStatement pstmt = conn.prepareStatement("DELETE FROM books WHERE id = ?");
pstmt.setInt(1, 1);
pstmt.executeUpdate();
pstmt.close();
```

- **Statement**: This is an interface that represents a SQL statement that you can execute against a database. You can create a Statement object by calling the **createStatement()** method of the Connection object. You can use a Statement object to execute SQL queries, updates, or batch commands.

- **PreparedStatement**: This is a subinterface of Statement that represents a SQL statement that has parameters that you can set dynamically. You can create a PreparedStatement object by calling the **prepareStatement()** method of the Connection object with a SQL string that has placeholders for the parameters. You can use a PreparedStatement object to execute SQL queries or updates with different values for the parameters, which can improve performance and security.
  
- **ResultSet**: This is an interface that represents the result of a SQL query. It contains a cursor that points to the current row of data. You can get a ResultSet object by calling the **executeQuery()** method of the Statement or PreparedStatement object. You can use a ResultSet object to retrieve the data from each column of the current row, and move the cursor to the next row.
  
- **executeUpdate()**: This is a method of the Statement and PreparedStatement interfaces that executes a SQL command that modifies the data in the database, such as INSERT, UPDATE, or DELETE. It returns an int value that indicates how many rows were affected by the command.
  
- **createStatement()**: This is a method of the Connection interface that creates a Statement object that you can use to execute SQL statements against the database. It returns a Statement object that you can use to call executeQuery() or executeUpdate().
  
- **close()**: This is a method of the Statement, PreparedStatement, ResultSet, and Connection interfaces that releases the resources associated with them and closes them. It is good practice to close these objects when you are done with them, to avoid memory leaks and performance issues. You can use a try-with-resources statement to automatically close them when they are out of scope.

- Statement is used to execute simple and static SQL queries that do not have any parameters. PreparedStatement is used to execute dynamic and parameterized SQL queries that have one or more placeholders (?). For example, in your code, you use Statement to create a table, and PreparedStatement to insert, update, and delete data from the table.
  
- PreparedStatement is faster and more efficient than Statement, because it precompiles and caches the SQL query in the database. This means that the query does not need to be parsed, compiled, planned, and optimized every time it is executed. Statement does not have this feature, so it has to go through all these steps for each query.
  
- PreparedStatement is safer and more secure than Statement, because it automatically prevents SQL injection attacks by escaping special characters in the parameters. SQL injection is a technique where malicious users can inject SQL commands into the query string and execute them on the database. Statement does not have this feature, so it is vulnerable to SQL injection if you concatenate user input into the query string.
  
- PreparedStatement is easier and more convenient than Statement, because it allows you to set different types of values in the parameters using various setXxx () methods. For example, you can use setString (), setInt (), setTimestamp (), etc. to set values of different data types. Statement does not have this feature, so you have to manually convert and format the values into strings.

Overall code is here:
```java
import java.sql.*;

public class Database {
    public static void main(String[] args) {
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            String url = "jdbc:mariadb://localhost:3306/java";
            String user = "root";
            String password = "let";
            Connection conn = DriverManager.getConnection(url, user, password);
            
            Statement stmt = conn.createStatement();
            stmt.executeUpdate("CREATE TABLE books (id INT PRIMARY KEY, title VARCHAR(100), author VARCHAR(50))");
            stmt.close();

            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO books VALUES (?,?,?);");
            pstmt.setInt(1, 1); // set the first parameter to 1
            pstmt.setString(2, "The Hitchhiker's Guide to the Galaxy"); // set the second parameter to the book title
            pstmt.setString(3, "Douglas Adams"); // set the third parameter to the author name
            pstmt.executeUpdate();
            pstmt.close();

            Statement stmt1 = conn.createStatement();
            ResultSet rs = stmt1.executeQuery("SELECT * FROM books;"); // get the result
            while (rs.next()) { // loop through the rows
                int id = rs.getInt("id"); // get the id column value
                String title = rs.getString("title"); // get the title column value
                String author = rs.getString("author"); // get the author column value
                System.out.println(id + " - " + title + " by " + author);
            }
            rs.close();
            stmt1.close();

            PreparedStatement pstmt1 = conn.prepareStatement("UPDATE books SET title = ? WHERE id = ?;");
            pstmt1.setString(1, "The Restaurant at the End of the Universe"); // set the new title
            pstmt1.setInt(2, 1); // set the id of the book to update
            pstmt1.executeUpdate(); // execute the statement
            pstmt1.close();            

            PreparedStatement pstmt2 = conn.prepareStatement("DELETE FROM books WHERE id = ?;");
            pstmt2.setInt(1, 1);
            pstmt2.executeUpdate();
            pstmt2.close();

            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

```

to run this code write in the terminal these:

	java -classpath /usr/share/java/mariadb-jdbc/mariadb-java-client.jar:. Database