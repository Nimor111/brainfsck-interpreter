{-# LANGUAGE OverloadedStrings #-}

module Main where

import           Control.Monad.IO.Class
import           System.Console.Haskeline
import           System.Environment       (getArgs)

import qualified Data.ByteString.Char8    as B

import           Lib                      (blocks)

import           Text.Brainfsck.Parser    (parseText)
import           Text.Brainfsck.Types

main :: IO ()
main = do
  args <- getArgs
  case args of
    [] -> putStrLn "Usage: stack exec brainfsck-exe <file_with_code>"
    _ -> do
      code <- B.readFile $ head args
      result <- blocks newBlocks $ parseText code
      B.putStrLn $ r result
