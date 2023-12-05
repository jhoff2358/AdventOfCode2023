module Day1Spec (spec) where

import Test.Hspec
import Day1

exampleInput1 :: String
exampleInput1 = "1abc2\n\
                \pqr3stu8vwx\n\
                \a1b2c3d4e5f\n\
                \treb7uchet\n"

exampleInput2 :: String
exampleInput2 = "two1nine\n\
                \eightwothree\n\
                \abcone2threexyz\n\
                \xtwone3four\n\
                \4nineeightseven2\n\
                \zoneight234\n\
                \7pqrstsixteen\n"

spec :: Spec
spec = do
  describe "Day 1" $ do
    it "solves part 1" $ do
      solvePart1 exampleInput1 `shouldBe` "142"
    it "solves part 2" $ do
      solvePart2 exampleInput2 `shouldBe` "281"
