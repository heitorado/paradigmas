-- Questao 'teórica' sobre a linguagem

-- A expressão map.(.) está correta.

-- sabemos que:
-- (.) :: (b -> c) -> (a -> b) -> a -> c
-- map :: (a -> b) -> [a] -> [b]

-- logo, compondo map com (.), teremos que:
-- (b -> c) === (a -> b) -> [a] -> [b]
-- (a -> b) === (b -> c) -> (a -> b) -> a -> c

-- Mas quem é C?
-- podemos fazer:

-- PARA O LADO DIREITO:
-- a === (b -> c)
-- b === (a -> b) -> a -> c

-- PARA O LADO ESQUERDO:
-- b === (a -> b)
-- c === [a] -> [b]

-- IGUALANDO b do lado ESQUERDO com b do lado DIREITO
-- a === (a -> b)
-- b === a -> c

-- SUBSTITINDO OS VALORES ENCONTRADOS EM C
-- [a] -> [b] === [(a -> b)] -> [(a -> c)]

-- POR FIM, TEMOS QUE
-- map.(.) :: (b -> c) -> [(a -> b)] -> [(a -> c)]