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
    Branco == Branco = True