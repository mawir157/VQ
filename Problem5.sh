ghc Problem5.hs > /dev/null
echo
echo "Haskell w/o -O2"
time ./Problem5
rm -rf Problem5
rm -rf Problem5.o
rm -rf Problem5.hi

ghc Problem5.hs -O2 > /dev/null
echo
echo "Haskell with -O2"
time ./Problem5
rm -rf Problem5
rm -rf Problem5.o
rm -rf Problem5.hi

g++ Problem5.cpp -o Problem5 > /dev/null
echo
echo "C++ w/o -O2"
time ./Problem5
rm -rf Problem5

g++ Problem5.cpp -o Problem5 -O2 > /dev/null
echo
echo "C++ with -O2"
time ./Problem5
rm -rf Problem5

echo
echo "python"
time python3 ./Problem5.py
