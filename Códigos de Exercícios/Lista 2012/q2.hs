sort :: (a -> a -> Bool) -> [a] -> [a]
sort _ [] = []
sort _ [a] = [a]
sort f (x:xs) = sort f [ a | a <- xs, f a x ] ++ [x] ++ sort f [ a | a <- xs, not(f(a)(x)) ]