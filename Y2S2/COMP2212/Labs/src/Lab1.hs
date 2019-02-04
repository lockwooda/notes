module Lab1 where
import System.IO

zipL :: [Int] -> [Int] -> [[Int]]
zipL [] [] = []
zipL (x:xs) [] = [x] : zipL xs []
zipL [] (y:ys) = [y] : zipL [] ys
zipL (x:xs) (y:ys) = [x, y] : zipL xs ys

unzipL :: [[Int]] -> ([Int], [Int])
unzipL [] = ([], [])
unzipL ([x, y]:xs) = (x:lx, y:ly)
    where (lx, ly) = unzipL xs

multiZipL :: [[a]] -> [[a]]
multiZipL [] = []
multiZipL x = map head x : multiZipL (filter (\x -> not (length x == 0)) (map tail x))

multiZipF :: IO ()
multiZipF = do 
    contents <- readFile "array.csv"
    let zipped = multiZipL $ auxStringToInt $ map (\x -> (map (\y -> if (y==',') then ' ' else y) x)) $ lines contents
    writeFile "arrayzipped.csv" (show zipped)

auxStringToInt :: [String] -> [[Int]]
auxStringToInt [] = []
auxStringToInt (x:xs) = (map (\y -> read y) $ words x) : auxStringToInt xs