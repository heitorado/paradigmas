-- a
poli :: Integer -> Integer -> Integer -> (Integer -> Integer)
poli a b c = (\x -> (a * x * x) + (b * x) + c)

-- b
listaPoli :: [(Integer, Integer, Integer)] -> [Integer -> Integer]
listaPoli [] = []
listaPoli ((a,b,c):xs) = [(\x -> (a * x * x) + (b * x) + c)] ++ listaPoli xs

-- c
appListaPoli :: [Integer -> Integer] -> [Integer] -> [Integer]
appListaPoli [] l = l
appListaPoli _ [] = []
appListaPoli lp li = [ f x | (f,x) <- zip lp li]