def strSort(s, caseSensitive=False):
	if caseSensitive:
		return ''.join(sorted(s))
	else :
		return ''.join(sorted(s.lower()))

import sys

if len(sys.argv) == 3:
	str1 = sys.argv[1]
	str2 = sys.argv[2]

	if strSort(str1) == strSort(str2):
		print(1)
	else:
		print(0)
else:
	print("invalid options")
	print("[Usage] python3 ./Problame.py [word 1] [word 2]")
