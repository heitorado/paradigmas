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

-- Test:
-- show(Compacta "GAP" 66.2)
-- show(Incandescente "LBAM" 60.0)

-- (Compacta "GAP" 66.2) == (Incandescente "LBAM" 60.0)
-- (Compacta "SGFL" 120.0) == (Compacta "LCCAO" 120.0)
-- (Incandescente "LAB7" 110.0) == (Incandescente "HSCS" 30.0) 
-- (Incandescente "HSCS" 30.0) == (Incandescente "HSCS" 30.0) 
-- Only the last one should be True.
