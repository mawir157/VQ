import Data.List (sort)

-- This function will return a list of 20,000,000 (bad) pseudo-random values
-- between 0 and p-1. 
linearGenerator :: Integer-> Integer-> Integer -> [Integer]
linearGenerator a b p = [ (a*x + b) `mod` p | x <- [0,1..20000000] ]

-- Given a list integers, this function returns the sum of the smallest n
-- elements.
-- In a strict language this would be slow since we have to sort the
-- whole list before summing the first N elements. However in Haskell the
-- standard sort algorithm is a quick sort, and since we only are only summing
-- the first n elements, lazy evaluation means that we can bail out early
sumSmallestN:: Int -> [Integer] -> Integer
sumSmallestN n xs = sum $ take n $ sort xs

wrapper :: ([Integer], [Integer], [Integer]) -> String
wrapper (xs, ys, zs) = comparer value1 value2 value3
  where value1 = sumSmallestN 50 xs
        value2 = sumSmallestN 50 ys
        value3 = sumSmallestN 50 zs

-- compare 3 integer values and print a message. If we return after the first
-- condition v2 and v3 are never evaluated
comparer :: Integer -> Integer -> Integer -> String
comparer v1 v2 v3
  | v1 < 5000   = "Array 1:" ++ (show v1)
  | v2 < 10000  = "Array 2:" ++ (show v2)
  | v3 < 20000  = "Array 3:" ++ (show v3)
  | otherwise = "Array Error"

main :: IO()
main = do
  -- Define 3 lists of psuedo-random integers, in this case since comparer
  -- returns on the first condition, so list2 and list3 are never evaluated.
  let list1 = linearGenerator 132953 514229 5195977 
  let list2 = linearGenerator 790879 324469 6860989
  let list3 = linearGenerator 222527 920209 9824429

  putStrLn $ wrapper (list1, list2, list3)
