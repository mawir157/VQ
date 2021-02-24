import Data.List (group, sort, sortBy)
import Data.Function (on)

main :: IO()
main = do
  f <- readFile "./input_03.txt"
  let fq = map (\x -> (head x, length x)) . group . sort $ lines f
  let ff = map (fst) $ take 4 $ reverse $ sortBy (compare `on` snd) fq
  mapM_ putStrLn ff
