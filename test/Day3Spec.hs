module Day3Spec (spec) where

import Test.Hspec
import Day3

exampleInput = "467..114..\n\
               \...*......\n\
               \..35..633.\n\
               \......#...\n\
               \617*......\n\
               \.....+.58.\n\
               \..592.....\n\
               \......755.\n\
               \...$.*....\n\
               \.664.598.."

spec :: Spec
spec = do
  describe "Day 3" $ do
    it "solves part 1" $ do
      solvePart1 exampleInput `shouldBe` "4361"
    it "solves part 2" $ do
      solvePart2 exampleInput `shouldBe` "467835"
