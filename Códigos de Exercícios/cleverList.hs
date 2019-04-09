-- escreva uma função f::[int] -> [Int] que retorna uma lista contendo todos
-- os elementos da lista dada como argumento que ocorrem duas vezes em sucessão.
-- Caso o elemento ocorra n vezes em sucessão (n >= 2), o elemento deve surgir (n-1) vezes
-- em sucessão na lista dada como resultado. Não é necessário definir o valor para lista vazia.
-- Ex:
-- f [1,2,2,3] = [2]
-- f [1,2,2,2,2,3] = [2,2,2]
-- f [3,2] = []
--
-- A) apresente uma solução que pode utilizar funções básicas e recursão, mas sem compreensão de listas
--
-- B) Apresente uma solução com compreensão de listas, mas que não tenha recursão


-- Sol. A
f :: [Int] -> [Int]
f [] = []
f (a:[]) = []
f (x:xs)
    | x == (head xs) = [x] ++ (f xs)
    | otherwise = f xs

