Given an array of integers `nums` and an integer `target`, return _indices of the two numbers such that they add up to `target`_.

You may assume that each input would have **_exactly_ one solution**, and you may not use the _same_ element twice.

You can return the answer in any order.
```python
def twoSum(nums, target):  
    for i in range(len(nums)):
       for j in range(i + 1, len(nums)):  
          if nums[i] + nums[j] == target:  
             return [i, j]  
    return  'could not find solution'
```
