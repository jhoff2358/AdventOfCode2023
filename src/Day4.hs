module Day4 where

import Data.List.Split (splitOn)

data Card = Card { num :: Int
                 , winning :: [Int]
                 , current :: [Int]
                 , numWinning :: Int
                 , score :: Int
                 , count :: Int }
   deriving (Show)

newCard :: String -> Card
newCard line = let [label, nums] = splitOn ":" line
                   [winningStr, currentStr] = splitOn "|" nums
                   winningNums = map read $ words winningStr
                   currentNums = map read $ words currentStr
                   numWinning = length $ filter (`elem` winningNums) currentNums
               in Card { num = read . last . words $ label
                       , winning = winningNums
                       , current = currentNums
                       , numWinning = numWinning
                       , score = if numWinning > 0 then 2 ^ (numWinning - 1) else 0
                       , count = 1 }

incrementCount :: Int -> Card -> Card
incrementCount num card = card { count = count card + num }

updateCounts :: [Card] -> [Card]
updateCounts [] = []
updateCounts (x:xs) = map (incrementCount $ count x) (take (numWinning x) xs) ++ drop (numWinning x) xs

updateAllCounts :: [Card] -> [Card]
updateAllCounts [] = []
updateAllCounts cards = head cards : updateAllCounts (updateCounts cards)

solvePart1 :: [String] -> String
solvePart1 lines = show $ sum $ map (score . newCard) lines

solvePart2 :: [String] -> String
solvePart2 lines = show $ sum $ map count $ updateAllCounts $ map newCard lines
