g :: [Int] -> Bool
g = foldr (&&) True . map (\x -> x `mod` 2 == 0) . filter (\x -> x >= 0 && x <=100)
