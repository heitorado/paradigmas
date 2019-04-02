data Expr = Lit Int |
            Add Expr Expr |
            Sub Expr Expr

data List t = Nil | Cons t (List t)

showExpr :: Expr -> String
showExpr (Lit i) = show i
showExpr (Add a b) = "(" ++ showExpr(a) ++ " + " ++ showExpr(b) ++ ")"
showExpr (Sub a b) = "(" ++ showExpr(a) ++ " - " ++ showExpr(b) ++ ")"


toList :: List t -> [t]
toList Nil = []
toList (Cons t l) = [t] ++ toList(l)

-- fromList :: [t] -> List t
-- depth :: Tree t -> Int
-- collapse :: Tree t -> [t]
-- mapTree :: (t -> u) -> Tree t -> Tree u