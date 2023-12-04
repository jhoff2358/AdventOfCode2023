module Main where

import System.Environment (getArgs)
import Text.Read (readMaybe)
import Helper

daysImplemented :: Int
daysImplemented = 4

main :: IO ()
main = do
    args <- getArgs
    case args of
        [] -> mapM_ runDay [1..daysImplemented] -- Adjust the range based on days implemented
        [dayStr] -> 
            case readMaybe dayStr :: Maybe Int of
                Just day -> runDay day
                Nothing -> putStrLn "Please provide a valid day number"
        _ -> putStrLn "Invalid arguments"
