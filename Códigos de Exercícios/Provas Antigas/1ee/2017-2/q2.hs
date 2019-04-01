somaImparMaiorQPar :: [Int] -> Bool
somaImparMaiorQPar [] = False
somaImparMaiorQPar l = sum [a | a <- l, odd a] > sum [b | b <- l, even b]

filtraListaSomaImpares :: [[Int]] -> [[Int]]
filtraListaSomaImpares [] = [[]]
filtraListaSomaImpares l = filter (somaImparMaiorQPar) (l)

maiorSoma :: [[Int]] -> Int
maiorSoma [] = 0
maiorSoma (x:xs) = max (sum x) (maiorSoma xs)

filtrarEInserir :: [[Int]] -> Int -> ([[Int]], Int)
filtrarEInserir a b = 
    let x = filtraListaSomaImpares a
        y = b * maiorSoma x
    in (x, y)