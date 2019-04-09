g :: [Int] -> Bool
g [] = True
g l = foldr(&&)(True)(map(even)(filter(>=0)(filter(<=100) l)))

-- Alternative Solution - Courtesy of @lucasbarross
g' :: [Int] -> Bool
g' = foldr (&&) True . map (\x -> x `mod` 2 == 0) . filter (\x -> x >= 0 && x <=100)

-- Tests:
-- g [-6,-4,1,2,3,4,5,6,7,2000]
-- g' [-6,-4,1,2,3,4,5,6,7,2000]
-- (Should be False)

-- g [-1,-2,-5,-125,-2,6,4758,124,7572,12,2,6,90,88,44,32,9999]
-- g' [-1,-2,-5,-125,-2,6,4758,124,7572,12,2,6,90,88,44,32,9999]
-- (Should be True)
