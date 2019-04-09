-- a
type Fabricante = String
type Watts = Float

data Lampada = Compacta Fabricante Watts | Incandescente Fabricante Watts

-- b
instance Show(Lampada) where
    show (Compacta f w) = "Compacta " ++ f ++ " " ++ show(w)
    show (Incandescente f w) = "Incandescente " ++ f ++ " " ++ show(w)

-- c
instance Eq(Lampada) where
    (Compacta f w) == (Compacta f' w') = ((f==f') && (w==w'))
    (Incandescente f w) == (Incandescente f' w') = ((f==f') && (w==w'))
    _ == _ = False
 
---------------------------------------
-------- Alternative Solutions --------
------ Courtesy of @lucasbarross ------
---------------------------------------    
--a) 
data Lampada' = Compacta String Float | Incandescente String Float
--

--b)
instance Show Lampada' where
    show (Compacta f w) = "Compacta " ++ f ++ " " ++ show w
    show (Incandescente f w) = "Incandescente " ++ f ++ " " ++ show w
--

--c)
instance Eq Lampada' where
    Compacta f w == Compacta f2 w2 = f == f2 && w == w2
    Incandescente f w == Incandescente f2 w2 = f == f2 && w == w2
    _ == _ = False

-- Tests:
-- show(Compacta "GAP" 66.2)
-- show(Incandescente "LBAM" 60.0)

-- (Compacta "GAP" 66.2) == (Incandescente "LBAM" 60.0)
-- (Compacta "SGFL" 120.0) == (Compacta "LCCAO" 120.0)
-- (Incandescente "LAB7" 110.0) == (Incandescente "HSCS" 30.0) 
-- (Incandescente "HSCS" 30.0) == (Incandescente "HSCS" 30.0) 
-- Only the last one should be True.
