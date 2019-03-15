somaDig :: Int -> Int
somaDig 0 = 0
somaDig x = (x `mod` 10) + somaDig(x `div` 10)

ordenar :: [Int] -> [Int]
ordenar [] = []
ordenar [a] = [a]
ordenar (x:xs) = ordenar [ a | a <- xs, somaDig a < somaDig x ] ++ [x] ++ ordenar [ a | a <- xs, somaDig a >= somaDig x ]