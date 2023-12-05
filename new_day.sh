#!/bin/bash

# Check if a day number is provided
if [ -z "$1" ]; then
    echo "Please provide a day number"
    exit 1
fi

DAY=$1

# Create the source file for the day
cat <<EOF > src/Day${DAY}.hs
module Day${DAY} where

solvePart1 :: String -> String
solvePart1 input = "placeholder"

solvePart2 :: String -> String
solvePart2 input = "placeholder"
EOF

# Create the test specification file for the day
cat <<EOF > test/Day${DAY}Spec.hs
module Day${DAY}Spec (spec) where

import Test.Hspec
import Day${DAY}

exampleInput :: String
exampleInput = "test\n\
               \test\n"

spec :: Spec
spec = do
  describe "Day ${DAY}" $ do
    it "solves part 1" $ do
      solvePart1 exampleInput \`shouldBe\` "0"
    it "solves part 2" $ do
      solvePart2 exampleInput \`shouldBe\` "0"
EOF

# Create an empty input file
touch input/Day${DAY}.txt

echo "Day $DAY template created."
