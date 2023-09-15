Given an integer `x`, return `true` _if_ `x` _is a_ _**palindrome**_ _, and_ `false` _otherwise_.
```python
def isPalindrome(number):  
    if number < 0: return False  
    reverseNum = 0  
    testNum = number  
    while testNum > 0:  
       reverseNum = reverseNum * 10 + testNum % 10  
       testNum = testNum // 10  
    return reverseNum == number
```
