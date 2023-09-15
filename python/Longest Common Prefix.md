Write a function to find the longest common prefix string amongst an array of strings.

If there is no common prefix, return an empty string `""`.

```python
def longestCommonPrefix(strs):
	if not strs:
		return ''

	prefix = ''
	min_length = min([len(s) for s in strs])

	for i in range(min_length):
		current_char = strs[0][i]

		for j in range(1, len(strs)):
			if strs[j][i] != current_char:
				return prefix
				
		prefix += current_char
		
	return prefix

print(longestCommonPrefix(['jaonh', 'james', 'january']))
```