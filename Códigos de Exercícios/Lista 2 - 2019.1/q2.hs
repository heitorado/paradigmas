g :: [Int] -> Bool
g [] = True
g l = foldr(&&)(True)(map(even)(filter(>=0)(filter(<=100) l)))

-- Tests:
-- g [-6,-4,1,2,3,4,5,6,7,2000]
-- (Should be False)

-- g [-1,-2,-5,-125,-2,6,4758,124,7572,12,2,6,90,88,44,32,9999]
-- (Should be True)