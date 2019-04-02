data Expr = Lit Int |
            Add Expr Expr |
            Sub Expr Expr

data List t = Nil | Cons t (List t) 
--    deriving Show
-- (Cons 1 (Cons 2 (Cons 3 (Cons 4 (Cons 5 Nil)))))

instance (Show t) => Show (List t) where
    show Nil = "Nil"
    show (Cons t l) = show(t) ++ ", " ++ show(l)

data Tree t = NilT | Node t (Tree t) (Tree t)
    deriving Show
-- (Node(1)(Node(2)(NilT)(NilT))(Node(3)(NilT)(NilT)))

showExpr :: Expr -> String
showExpr (Lit i) = show i
showExpr (Add a b) = "(" ++ showExpr(a) ++ " + " ++ showExpr(b) ++ ")"
showExpr (Sub a b) = "(" ++ showExpr(a) ++ " - " ++ showExpr(b) ++ ")"

toList :: List t -> [t]
toList Nil = []
toList (Cons t l) = [t] ++ toList(l)

fromList :: [t] -> List t
fromList [] = Nil
fromList (x:xs) = (Cons x (fromList xs))

depth :: Tree t -> Int
depth NilT = 0
depth (Node t l r) = 1 + (max (depth l) (depth r))

collapse :: Tree t -> [t]
collapse NilT = []
collapse (Node t ls rs) =  [t] ++ collapse(ls) ++ collapse(rs)

mapTree :: (t -> u) -> Tree t -> Tree u
mapTree _ NilT = NilT
mapTree f (Node t ls rs) = (Node (f(t)) (mapTree f ls) (mapTree f rs))