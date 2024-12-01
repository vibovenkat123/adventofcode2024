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

main = do
  let l = getLines "in"
  lines <- l
  let intLines = stringsToInts lines
  let (a, b) = split intLines
  let (sA, sB) = (sort a, sort b)
  let dist = zipWith (\x y -> abs $ x - y) sA sB
  print (sum dist)
