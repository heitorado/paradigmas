data Expr = Lit Int |
            Add Expr Expr |
            Sub Expr Expr

showExpr :: Expr -> String
showExpr (Lit i) = show i
showExpr (Add a b) = "(" ++ showExpr(a) ++ " + " ++ showExpr(b) ++ ")"
showExpr (Sub a b) = "(" ++ showExpr(a) ++ " - " ++ showExpr(b) ++ ")"


-- toList :: List t -> [t]
-- fromList :: [t] -> List t
-- depth :: Tree t -> Int
-- collapse :: Tree t -> [t]
-- mapTree :: (t -> u) -> Tree t -> Tree u