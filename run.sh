echo
echo "Problem 1 (C++)"
g++ Problem1.cpp -o p1 > /dev/null
./p1 45.7 -10.4
rm -rf p1

echo
echo "Problem 2 (C++)"
g++ Problem2.cpp -o p2 > /dev/null
./p2 gifthorse Foresight
rm -rf p2

echo
echo "Problem 2 (python)"
python3 ./Problem2.py Orchestra carthorse

echo 
echo "Problem 3 (C++)"
g++ Problem3.cpp -o p3 > /dev/null
./p3 input_03.txt
rm -rf p3

echo
echo "Problem 3 (Haskell)"
ghc Problem3.hs > /dev/null
./Problem3
rm -rf Problem3.o Problem3.hi Problem3

echo
echo "Problem 4 (python)"
python3 ./Problem4.py
display filtered_image_10.jpg
rm -rf filtered_image_*.jpg

echo
echo "Problem 5"

echo
echo "Haskell w/o -O2"
ghc Problem5.hs > /dev/null
time ./Problem5
rm -rf Problem5
rm -rf Problem5.o
rm -rf Problem5.hi

echo
echo "Haskell with -O2"
ghc Problem5.hs -O2 > /dev/null
time ./Problem5
rm -rf Problem5 Problem5.o Problem5.hi

echo
echo "C++ w/o -O2"
g++ Problem5.cpp -o Problem5 > /dev/null
time ./Problem5
rm -rf Problem5

echo
echo "C++ with -O2"
g++ Problem5.cpp -o Problem5 -O2 > /dev/null
time ./Problem5
rm -rf Problem5

echo
echo "python"
time python3 ./Problem5.py
