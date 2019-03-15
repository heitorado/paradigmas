type Pessoa = String
type Livro = String
type BancoDados = [(Pessoa, Livro)]

baseExemplo :: BancoDados
baseExemplo = [("Sergio", "O Senhor dos Aneis"),("Andre", "Duna"),("Fernando", "Jonathan Strange & Mr. Norrell"),("Fernando", "Duna") ]

---------------------------------------------------
--Definição das funções usando List Comprehension--
---------------------------------------------------

--Dado um banco e uma pessoa P, retorna uma lista de livros sob posse de P
livros :: BancoDados -> Pessoa -> [Livro]
livros base pessoa = [ l | (p,l) <- base, p == pessoa]

--Dado um banco e um livro L, retorna quantas pessoas emprestaram L
emprestimos :: BancoDados -> Livro ->[Pessoa]


--Dado um banco e um livro L, retorna se L está emprestado
emprestado :: BancoDados -> Livro -> Bool


--Dado um banco e uma pessoa P, retorna quantos livros existem sob posse da pessoa
qtdEmprestimos :: BancoDados -> Pessoa -> Int


--Dado um banco e uma pessoa P e um livro L, adiciona a tupla (P,L) no banco e retorna o novo banco
emprestar :: BancoDados -> Pessoa -> Livro -> BancoDados


--Dado um banco, uma pessoa P e um livro L, remove a tupla (P,L) do banco e retorna o novo banco
devolver :: BancoDados -> Pessoa -> Livro -> BancoDados
