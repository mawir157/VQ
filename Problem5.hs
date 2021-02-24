import Data.List (sort)

-- The purpose of this example is to demonstrate Haskell's lazy evaluation.
-- Essentially Haskell will not evaluate an expression until is it required.
-- This can lead to faster faster code
-- The cost is that it much harder to reason about memory usage, particularly 
-- in recursives functions.

-- This function will return a list of 20,000,000 (bad) pseudo-random values
-- between 0 and p-1. 
linearGenerator :: Integer-> Integer-> Integer -> [Integer]
linearGenerator a b p = [ (a*x + b) `mod` p | x <- [0,1..20000000] ]

-- Given a list integers, this function returns the sum of the smallest 
-- elements.
-- In a strict language this would be slow since we have to sort the
-- whole list before summing the first N elements. However in Haskell the
-- standard sort algorithm is a quick sort, and since we only are only summing
-- the first n elements, lazy evaluation means that 
sumSmallestN:: Int -> [Integer] -> Integer
sumSmallestN n xs = sum $ take n $ sort xs

function1 :: ([Integer], [Integer], [Integer]) -> String
function1 (xs, ys, zs) = function2 value1 value2 value3
  where value1 = sumSmallestN 50 xs
        value2 = sumSmallestN 50 ys
        value3 = sumSmallestN 50 zs

function2 :: Integer -> Integer -> Integer -> String
function2 x y z
  | x < 5000   = "Array 1:" ++ (show x)
  | y < 10000  = "Array 2:" ++ (show y)
  | z < 20000  = "Array 3:" ++ (show z)
  | otherwise = "Array Error"

main :: IO()
main = do
  -- Define 3 lists of psuedo-random integers, in this case since function2
  -- returns on the first condition, list2 and list3 are never evaluated.
  let list1 = linearGenerator 132953 514229 5195977 
  let list2 = linearGenerator 790879 324469 6860989
  let list3 = linearGenerator 222527 920209 9824429

  putStrLn $ function1 (list1, list2, list3)
