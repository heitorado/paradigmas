-- a
poli :: Integer -> Integer -> Integer -> (Integer -> Integer)
poli a b c = (\x -> a*x*x + b*x + c)

-- b
listaPoli :: [(Integer, Integer, Integer)] -> [(Integer -> Integer)]
listaPoli [] = []
listaPoli ((a,b,c):xs) = (poli a b c):listaPoli(xs)

-- c
appListaPoli :: [Integer -> Integer] -> [Integer] -> [Integer]
appListaPoli [] l = l 
appListaPoli _ [] = []
appListaPoli fl il = [ f(x) | (f,x) <- zip fl il ]