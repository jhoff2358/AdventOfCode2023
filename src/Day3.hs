module Day3 where

import Data.Char (isDigit)
import Data.Maybe (mapMaybe)
import Data.List (unfoldr)
import qualified Data.Vector as V

data SchematicNumber = SchematicNumber
   { value :: Int, row :: Int, start :: Int, end :: Int }
instance Show SchematicNumber where
   show (SchematicNumber value row start end) =
      show value ++ ": row " ++ show row ++ ", " ++ show start ++ "-" ++ show end

type Vec2D a = V.Vector (V.Vector a)

isSymbol :: Char -> Bool
isSymbol c = not (isDigit c || c == '.')

getSymbolVector :: [String] -> Vec2D Bool
getSymbolVector input = V.fromList $ map (V.fromList . map isSymbol) input

getSymbolIndices :: Vec2D Bool -> [(Int, Int)]
getSymbolIndices vec = [ (i, j) | (i, row) <- zip [0..] (V.toList vec)
                                , (j, val) <- zip [0..] (V.toList row)
                                , val]

getElement :: Vec2D a -> (Int, Int) -> Maybe a
getElement vec (i, j) = do
    row <- vec V.!? i
    row V.!? j

processLine :: Int -> String -> [SchematicNumber]
processLine rowNum line = unfoldr go (line, 0)
   where
      go ("", _) = Nothing
      go (s, idx) =
         let (numStr, rest) = span isDigit s
             (nonNumStr, rest') = break isDigit rest
         in if null numStr
            then go (rest', idx + length rest - length rest')
            else Just (SchematicNumber (read numStr) rowNum idx (idx + length numStr - 1), (rest', idx + length nonNumStr + length numStr))

getNums :: [String] -> [SchematicNumber]
getNums input = concat $ zipWith processLine [0..] input

-- Builds a list of indices that are adjacent to the sequence, including
buildAdjacentIndices :: Int -> Int -> Int -> [(Int, Int)]
buildAdjacentIndices row start end = 
   [ (i,j) | i <- [row-1 .. row+1]
           , j <- [start-1 .. end+1]
           , onBorder i j ]
   where
      onBorder i j
         | i == row = j < start || j > end
         | otherwise = True

adjacentToSymbol :: Vec2D Bool -> SchematicNumber -> Bool
adjacentToSymbol symbols (SchematicNumber _ row start end) = 
   or $ mapMaybe (getElement symbols) (buildAdjacentIndices row start end)

adjacentToIndex :: (Int, Int) -> SchematicNumber -> Bool
adjacentToIndex (i, j) (SchematicNumber _ row start end) =
   (abs (row - i) <= 1) && j >= start - 1 && j <= end + 1

getGearRatio :: [SchematicNumber] -> (Int, Int) -> Maybe Int
getGearRatio nums pos = case filter (adjacentToIndex pos) nums of
   [num1, num2] -> Just $ value num1 * value num2
   _ -> Nothing

parseInput :: [String] -> (Vec2D Bool, [SchematicNumber])
parseInput lines = (getSymbolVector lines, getNums lines)

solvePart1 :: [String] -> String
solvePart1 lines = show $ sum $ map value $ filter (adjacentToSymbol symbolVector) nums
   where 
      (symbolVector, nums) = parseInput lines

solvePart2 :: [String] -> String
solvePart2 lines = show $ sum $ mapMaybe (getGearRatio nums) (getSymbolIndices symbolVector)
   where
      (symbolVector, nums) = parseInput lines