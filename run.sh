#!/bin/bash

# Check if a day number is provided
if [ -z "$1" ]; then
    # Run the main program without arguments
    cabal run AdventOfCode2023
else
    DAY=$1
    # Run the solution for the specified day
    cabal run AdventOfCode2023 -- $DAY
fi
