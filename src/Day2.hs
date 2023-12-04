module Day2 where

import Data.Char (isDigit, isSpace)
import Data.List.Split (splitOn, wordsBy)
import Control.Applicative (liftA2)
import Text.Read (readMaybe, get)
import Data.Maybe (mapMaybe)
import Data.List (maximumBy)
import Data.Ord (comparing)

data Color = Red | Green | Blue
   deriving (Eq, Enum, Show)
data ColorCount = ColorCount { count :: Int, color :: Color}
data Game = Game { num :: Int, counts :: [[ColorCount]]}


instance Show ColorCount where
   show (ColorCount count color) = show count ++ " " ++ showColor color
instance Show Game where
   show (Game num counts) = "Game " ++ show num ++ "; " ++ concatMap show counts

parseColor :: String -> Maybe Color
parseColor s = case s of
   "red" -> Just Red
   "blue" -> Just Blue
   "green" -> Just Green
   _ -> Nothing

showColor :: Color -> String
showColor s = case s of
   Red -> "red"
   Blue -> "blue"
   Green -> "green"

-- | -------------------------
-- | Section: Parsing input
-- | -------------------------
parsePair :: String -> Maybe ColorCount
parsePair s = liftA2 ColorCount (readMaybe num) (parseColor col)
   where
      [num, col] = splitOn " " s

-- Just drops invalid pairs with `mapMaybe` lazy solution but eh
parseSet :: String -> [ColorCount]
parseSet set = mapMaybe (parsePair . dropWhile isSpace) (splitOn "," set)

-- Splits and parses a single game's data
parseGame :: String -> Game
parseGame gameData = Game { num = read $ last $ splitOn " " label
                          , counts = map parseSet sets }
   where
      (label:sets) =  map (dropWhile isSpace) $ wordsBy (\c -> c == ';' || c == ':') gameData

-- | -------------------------
-- | Section: Validating games
-- | -------------------------
validPair :: ColorCount -> Bool
validPair (ColorCount num col) = case col of
   Red -> num <= 12
   Green -> num <= 13
   Blue -> num <= 14

validGame :: Game -> Bool
validGame (Game _ counts) = all (all validPair) counts

getPullsByColor :: Color -> Game -> [ColorCount]
getPullsByColor expectedColor (Game _ counts) = 
   filter (\cc -> color cc == expectedColor) (concat counts)

minRequired :: Game -> (ColorCount, ColorCount, ColorCount)
minRequired game = (minRed, minBlue, minGreen)
   where
      minRed = maximumByColor Red
      minBlue = maximumByColor Blue
      minGreen = maximumByColor Green
      maximumByColor color = maximumBy (comparing count) (getPullsByColor color game)

powerSet :: (ColorCount, ColorCount, ColorCount) -> Int
powerSet (a, b, c) = count a * count b * count c

solvePart1 :: [String] -> String
solvePart1 lines = show $ sum $ map num $ filter validGame $ map parseGame lines

solvePart2 :: [String] -> String
solvePart2 lines = show $ sum $ map (powerSet . minRequired . parseGame) lines
