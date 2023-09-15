This program prints out all Fibonacci sequence up to given number.
```python
def fibonacci(number):  
    if number < 0:  
       return 'there is no negative number in the fibonacci sequence'  
    a, b = 0, 1  
    while a <= number:  
       print(a)  
       a, b = b, a + b
```
