module Main where

import Data.List (elemIndex, sort)

main :: IO ()
getLines :: String -> IO [String]
getLines file = readFile file >>= return . words
stringsToInts :: [String] -> [Int]
stringsToInts = map read
split :: [Int] -> ([Int], [Int])
split [] = ([], [])
split (x : xs) = (x : evens, odds)
 where
  (odds, evens) = split xs
count :: (Eq a) => a -> [a] -> Int
count x = length . filter (x ==)
sim :: Int -> [Int] -> Int
sim x xs = x * (count x xs)
main = do
  let l = getLines "in"
  lines <- l
  let intLines = stringsToInts lines
  let (a, b) = split intLines
  let f = map (\x -> (sim x b)) a
  print (sum f)
