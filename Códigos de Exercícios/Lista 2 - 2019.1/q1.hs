-- A
f :: [Int] -> [Int]
f [] = []
f (x:[]) = []
f (x:xs)
    | x == (head xs) = [x] ++ f xs
    | otherwise = f xs

-- B
