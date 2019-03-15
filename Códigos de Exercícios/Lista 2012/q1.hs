fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = (fib (n-1)) + (fib (n-2))

aaa :: Int -> Int -> [Int]
aaa 0 _ = []
aaa n x
  | fib x `mod` 2 == 0 = [fib x] ++ (aaa (n-1)(x+1) )
  | otherwise = [] ++  (aaa (n)(x+1))


answer :: Int -> [Int]
answer 0 = []
answer n = aaa n 1