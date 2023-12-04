module Helper where

import qualified Day1
import qualified Day2
import qualified Day3
import qualified Day4
-- import qualified Day5
-- import qualified Day6
-- import qualified Day7
-- import qualified Day8
-- import qualified Day9
-- import qualified Day10
-- import qualified Day11
-- import qualified Day12
-- import qualified Day13
-- import qualified Day14
-- import qualified Day15
-- import qualified Day16
-- import qualified Day17
-- import qualified Day18
-- import qualified Day19
-- import qualified Day20
-- import qualified Day21
-- import qualified Day22
-- import qualified Day23
-- import qualified Day24
-- import qualified Day25

runDay :: Int -> IO ()
runDay day = do
   let filePath = "input/Day" ++ show day ++ ".txt"
   input <- readFile filePath
   case day of
      1  -> runSolution  Day1.solvePart1  Day1.solvePart2 input
      2  -> runSolution  Day2.solvePart1  Day2.solvePart2 input
      3  -> runSolution  Day3.solvePart1  Day3.solvePart2 input
      4  -> runSolution  Day4.solvePart1  Day4.solvePart2 input
      -- 5  -> runSolution  Day5.solvePart1  Day5.solvePart2 input
      -- 6  -> runSolution  Day6.solvePart1  Day6.solvePart2 input
      -- 7  -> runSolution  Day7.solvePart1  Day7.solvePart2 input
      -- 8  -> runSolution  Day8.solvePart1  Day8.solvePart2 input
      -- 9  -> runSolution  Day9.solvePart1  Day9.solvePart2 input
      -- 10 -> runSolution Day10.solvePart1 Day10.solvePart2 input
      -- 11 -> runSolution Day11.solvePart1 Day11.solvePart2 input
      -- 12 -> runSolution Day12.solvePart1 Day12.solvePart2 input
      -- 13 -> runSolution Day13.solvePart1 Day13.solvePart2 input
      -- 14 -> runSolution Day14.solvePart1 Day14.solvePart2 input
      -- 15 -> runSolution Day15.solvePart1 Day15.solvePart2 input
      -- 16 -> runSolution Day16.solvePart1 Day16.solvePart2 input
      -- 17 -> runSolution Day17.solvePart1 Day17.solvePart2 input
      -- 18 -> runSolution Day18.solvePart1 Day18.solvePart2 input
      -- 19 -> runSolution Day19.solvePart1 Day19.solvePart2 input
      -- 20 -> runSolution Day20.solvePart1 Day20.solvePart2 input
      -- 21 -> runSolution Day21.solvePart1 Day21.solvePart2 input
      -- 22 -> runSolution Day22.solvePart1 Day22.solvePart2 input
      -- 23 -> runSolution Day23.solvePart1 Day23.solvePart2 input
      -- 24 -> runSolution Day24.solvePart1 Day24.solvePart2 input
      -- 25 -> runSolution Day25.solvePart1 Day25.solvePart2 input
      _ -> putStrLn "Day not implemented"

runSolution :: ([String] -> String) -> ([String] -> String) -> String -> IO ()
runSolution solvePart1 solvePart2 input = do
    putStrLn $ solvePart1 $ lines input
    putStrLn $ solvePart2 $ lines input