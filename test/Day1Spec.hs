module Day1Spec (spec) where

import Test.Hspec
import Day1

exampleInput1 :: [String]
exampleInput1 =
  [ "1abc2"
  , "pqr3stu8vwx"
  , "a1b2c3d4e5f"
  , "treb7uchet" ]

exampleInput2 :: [String]
exampleInput2 =
  [ "two1nine"
  ,  "eightwothree"
  ,  "abcone2threexyz"
  ,  "xtwone3four"
  ,  "4nineeightseven2"
  ,  "zoneight234"
  ,  "7pqrstsixteen" ]

spec :: Spec
spec = do
  describe "Day 1" $ do
    it "solves part 1" $ do
      solvePart1 exampleInput1 `shouldBe` "142"
    it "solves part 2" $ do
      solvePart2 exampleInput2 `shouldBe` "281"
