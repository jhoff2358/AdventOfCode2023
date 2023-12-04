{-# OPTIONS_GHC -F -pgmF hspec-discover #-}
import Test.Hspec
import Test.Hspec.Runner
import System.Environment (getArgs)

import qualified Day1Spec
import qualified Day2Spec
import qualified Day3Spec
import qualified Day4Spec
-- import qualified Day5Spec
-- import qualified Day6Spec
-- import qualified Day7Spec
-- import qualified Day8Spec
-- import qualified Day9Spec
-- import qualified Day10Spec
-- import qualified Day11Spec
-- import qualified Day12Spec
-- import qualified Day13Spec
-- import qualified Day14Spec
-- import qualified Day15Spec
-- import qualified Day16Spec
-- import qualified Day17Spec
-- import qualified Day18Spec
-- import qualified Day19Spec
-- import qualified Day20Spec
-- import qualified Day21Spec
-- import qualified Day22Spec
-- import qualified Day23Spec
-- import qualified Day24Spec
-- import qualified Day25Spec

main :: IO ()
main = do
   args <- getArgs
   hspecWith defaultConfig { configArgs = args } $ do
      describe "Day 1 Tests" Day1Spec.spec
      describe "Day 2 Tests" Day2Spec.spec
      describe "Day 3 Tests" Day3Spec.spec
      describe "Day 4 Tests" Day4Spec.spec
      -- describe "Day 5 Tests" Day5Spec.spec
      -- describe "Day 6 Tests" Day6Spec.spec
      -- describe "Day 7 Tests" Day7Spec.spec
      -- describe "Day 8 Tests" Day8Spec.spec
      -- describe "Day 9 Tests" Day9Spec.spec
      -- describe "Day 10 Tests" Day10Spec.spec
      -- describe "Day 11 Tests" Day11Spec.spec
      -- describe "Day 12 Tests" Day12Spec.spec
      -- describe "Day 13 Tests" Day13Spec.spec
      -- describe "Day 14 Tests" Day14Spec.spec
      -- describe "Day 15 Tests" Day15Spec.spec
      -- describe "Day 16 Tests" Day16Spec.spec
      -- describe "Day 17 Tests" Day17Spec.spec
      -- describe "Day 18 Tests" Day18Spec.spec
      -- describe "Day 19 Tests" Day19Spec.spec
      -- describe "Day 20 Tests" Day20Spec.spec
      -- describe "Day 21 Tests" Day21Spec.spec
      -- describe "Day 22 Tests" Day22Spec.spec
      -- describe "Day 23 Tests" Day23Spec.spec
      -- describe "Day 24 Tests" Day24Spec.spec
      -- describe "Day 25 Tests" Day25Spec.spec