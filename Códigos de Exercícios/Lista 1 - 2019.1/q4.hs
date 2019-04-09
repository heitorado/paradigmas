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

 -- b
swap :: (Eq a) => [[a]] -> Int -> Int -> [[a]]
swap l x y
    | x < y =
        let l1 = l !! x
            l2 = l !! y
        in (take x l) ++ [l2] ++ (take (y-x-1) (drop (x+1) l)) ++ [l1] ++ (take (length l) (drop (y+1) l))
    | otherwise = l

-- Test:
-- swap [[1,2,3],[4,5,6],[7,8,9]] 0 2
-- swap [[0],[1],[2],[3],[4],[5],[6],[7]] 2 5
-- swap [[0],[1],[2],[3],[4],[5],[6],[7]] 3 4
-- swap [[0],[1],[2],[3],[4],[5],[6],[7]] 0 7
-- swap [[0],[1],[2],[3],[4],[5],[6],[7]] 3 7

