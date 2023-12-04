module Day1 where

import Data.Char (isDigit, digitToInt)
import Data.List (isPrefixOf, isSuffixOf, findIndex, tails, elemIndex)

digits :: [String]
digits = [ "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" ]

startsWithDigit :: String -> Maybe Int
startsWithDigit str = findIndex (`isPrefixOf` str) digits

findFirstDigit :: String -> Int
findFirstDigit [] = error "Invalid line"
findFirstDigit s@(x:xs)
   | isDigit x = digitToInt x
   | otherwise = case startsWithDigit s of
      Just n -> n
      Nothing -> findFirstDigit xs

findLastDigit :: String -> Int
findLastDigit str = go $ reverse $ tails str
   where
      go [] = error "Invalid line"
      go (x:xs)
         | null x = go xs
         | isDigit (head x) = digitToInt (head x)
         | otherwise = case startsWithDigit x of
            Just n -> n
            Nothing -> go xs

concatInt :: Int -> Int -> String
concatInt x y = show x ++ show y

-- Simplified version, works with part 1.
numFromLine :: String -> Int
numFromLine str = read [head nums, last nums]
   where
      nums = filter isDigit str

-- Complex version for part 2. Uses expensive findFirstDigit and findLastDigit
-- functions to account for possibility of digits being spelled out.
numFromLineComplex :: String -> Int
numFromLineComplex str = read $ concatInt (findFirstDigit str) (findLastDigit str)

solvePart1 :: [String] -> String
solvePart1 lines = show $ sum $ map numFromLine lines

solvePart2 :: [String] -> String
solvePart2 lines = show $ sum $ map numFromLineComplex lines