#!/bin/bash

# Check if a day number is provided
if [ -z "$1" ]; then
    # Run all tests
    cabal run advent-tests
else
    DAY=$1
    # Run the test for the specified day
    cabal run advent-tests -- -m "Day $DAY"
fi
