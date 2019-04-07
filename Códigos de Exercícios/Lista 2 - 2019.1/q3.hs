--a) 
data Lampada = Compacta String Float | Incandescente String Float
--

--b)
instance Show Lampada where
    show (Compacta f w) = "Compacta " ++ f ++ " " ++ show w
    show (Incandescente f w) = "Incandescente " ++ f ++ " " ++ show w
--

--c)
instance Eq Lampada where
    Compacta f w == Compacta f2 w2 = f == f2 && w == w2
    Incandescente f w == Incandescente f2 w2 = f == f2 && w == w2
    _ == _ = False
