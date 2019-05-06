module Main where
import Tokens
import Grammar

main :: IO Exp
main = do
    contents <- readFile "Expression.txt"
    let expr = parseCalc $ alexScanTokens contents
    return expr