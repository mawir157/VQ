def linearGenerator(a, b, p):
  return [ ((a*i + b) % p) for i in range(0, 20000000)]

def sumSmallestN(n, arr):
	arr.sort()
	return sum(arr[0:n])

def function1(arr1, arr2, arr3):
	value1 = sumSmallestN(50, arr1)
	value2 = sumSmallestN(50, arr2)
	value3 = sumSmallestN(50, arr3)
	return function2(value1, value2, value3)

def function2(v1, v2, v3):
	if v1 < 5000:
		return "Array 1:" + str(v1)
	elif v2 < 10000:
		return "Array 2:" + str(v2)
	elif v3 < 20000:
		return "Array 3:" + str(v3)
	else:
		return "Array Error"

list1 = linearGenerator(132953, 514229, 5195977)
list2 = linearGenerator(790879, 324469, 6860989)
list3 = linearGenerator(222527, 920209, 9824429)

print(function1(list1, list2, list3))
