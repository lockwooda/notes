zipL :: [Int] -> [Int] -> [[Int]]
zipL [] [] = [[]]
zipL (x:xs) (y:ys)
    | length (x:xs) == length (y:ys) = [x, y] : zipL xs ys