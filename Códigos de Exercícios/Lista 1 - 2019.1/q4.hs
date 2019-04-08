-- a
isMatrix :: [[a]] -> Bool
isMatrix [] = False
isMatrix m
    | length(filter (==(length(head m))) [length x | x <- m]) == length m = True
    | otherwise = False
 -- Test:
 -- isMatrix [[1,2,3],[4,5,6],[7,8,9]]
 -- isMatrix [[1,2,3],[5,6,7,8],[1,2,3]]
 -- isMatrix [[1,2,3],[5,6],[1,2,3]]
 -- isMatrix [[1,2,3,4,5],[1,2,3,4],[1,2,3],[1,2],[1]]