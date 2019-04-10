vendas :: Int -> Int
vendas i
    | i < size = list !! i
    | otherwise = list !! ((length list) - 1)
    where
        list = [7,4,0,6,2,6,9,32,6,8,2,0,6,7,9,2,3,0,6,9,2,6,9,1,0,2,3,1,54,67,14,7,23,1,25,9,78]
        size = length list
 
-- A
zeroVendasA :: Int -> Int
zeroVendasA n = length[ x | x <- [0..n], (vendas x) == 0]

-- B
zeroVendasB :: Int -> Int
zeroVendasB n = length(filter(==0)(map (vendas) ([0..n])))

-- C
zeroVendasC :: Int -> Int
zeroVendasC n = foldr (sumOneIfSoldZero) 0 [0..n]

sumOneIfSoldZero :: Int -> Int -> Int
sumOneIfSoldZero a b
    | v > 0 = b
    | otherwise = (b+1)
    where
        v = vendas(a)


-- Tests:
-- zeroVendasX 100
    -- should be 4