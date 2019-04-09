-- A
f :: [Int] -> [Int]
f [] = []
f (x:[]) = []
f (x:xs)
    | x == (head xs) = [x] ++ f xs
    | otherwise = f xs

-- B
f :: [Int] -> [Int]
f arr = [ i | (i, j) <- (zip arr (drop 1 arr)), i == j]
