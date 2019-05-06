module MDLMain where
import MDLTokens
import MDLGrammar

main :: IO [Expr]
main = do
    contents <- readFile "MDLExpression.txt"
    let linescontent = lines contents
    let expr = [parseMDL $ alexScanTokens x | x <- linescontent]
    return expr