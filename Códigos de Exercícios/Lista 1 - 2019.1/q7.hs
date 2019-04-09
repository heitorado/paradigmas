type Codigo = Int
data Voto = Presidente Codigo | Senador Codigo | Deputado Codigo | Branco
    deriving(Show)
type Urna = [Voto]
type Apuracao = [(Voto, Int)]

--totalVotos :: Urna -> Voto -> Int
--apurar :: Urna -> Apuracao

-- a
instance Eq (Voto) where
    Presidente a == Presidente b = a == b
    Senador a == Senador b = a == b
    Deputado a == Deputado b = a == b
    _ == _ = False

-- b
totalVotos :: Urna -> Voto -> Int
totalVotos [] _ = 0
totalVotos allVotos voto = length [ x | x <- allVotos, x == voto]

-- c
apurar :: Urna -> Apuracao
apurar [] = []
apurar (x:xs) = 
    let v = x
        c = (totalVotos xs v) + 1
        u = filter(/=v)(xs)
    in [(v,c)] ++ apurar u

-------------------------
-- Solução alternativa --
------- Por ~lbam -------
-------------------------

totalVotos' :: Urna -> Voto -> Int
totalVotos' [] v = 0
totalVotos' (x:xs) v
    | x == v = 1 + totalVotos' xs v
    | otherwise = 0 + totalVotos' xs v

apurar' :: Urna -> Apuracao
apurar' u = [(l, totalVotos' u l) | l <- candidatos' u] 

candidatos' :: Urna -> [Voto]
candidatos' [] = []
candidatos' (x:xs) = x : filter (/= x) (candidatos' xs)