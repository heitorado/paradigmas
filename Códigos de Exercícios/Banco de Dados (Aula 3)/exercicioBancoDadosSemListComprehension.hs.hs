type Pessoa = String
type Livro = String
type BancoDados = [(Pessoa, Livro)]

baseExemplo :: BancoDados
baseExemplo = [("Sergio", "O Senhor dos Aneis"),("Andre", "Duna"),("Fernando", "Jonathan Strange & Mr. Norrell"),("Fernando", "Duna") ]

---------------------------------------------------------
--Definição das funções sem utilizar List Comprehension--
---------------------------------------------------------

--Dado um banco e uma pessoa P, retorna uma lista de livros sob posse de P
livros :: BancoDados -> Pessoa -> [Livro]
livros [] p = []
livros (x:xs) p
  | p == fst x = livros xs p ++ [snd x]
  | otherwise = livros xs p

--Dado um banco e um livro L, retorna quantas pessoas emprestaram L
emprestimos :: BancoDados -> Livro ->[Pessoa]
emprestimos [] l = []
emprestimos (x:xs) l
  | l == snd x = emprestimos xs l ++ [fst x]
  | otherwise = emprestimos xs l

--Dado um banco e um livro L, retorna se L está emprestado
emprestado :: BancoDados -> Livro -> Bool
emprestado [] l = False
emprestado (x:xs) l
  | l == snd x = True
  | otherwise = emprestado xs l

--Dado um banco e uma pessoa P, retorna quantos livros existem sob posse da pessoa
qtdEmprestimos :: BancoDados -> Pessoa -> Int
qtdEmprestimos [] p = 0
qtdEmprestimos (x:xs) p
  | p == fst x = 1 + qtdEmprestimos xs p
  | otherwise = qtdEmprestimos xs p

--Dado um banco e uma pessoa P e um livro L, adiciona a tupla (P,L) no banco e retorna o novo banco
emprestar :: BancoDados -> Pessoa -> Livro -> BancoDados
emprestar banco p l = baseExemplo ++ [(p,l)]

--Dado um banco, uma pessoa P e um livro L, remove a tupla (P,L) do banco e retorna o novo banco
devolver :: BancoDados -> Pessoa -> Livro -> BancoDados
devolver [] p l = []
devolver (x:xs) p l
  | x == (p,l) = devolver xs p l
  | otherwise = x : devolver xs p l