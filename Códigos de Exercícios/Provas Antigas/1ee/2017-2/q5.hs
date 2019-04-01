data Mobile = Pendente Int | Barra Mobile Mobile

peso :: Mobile -> Int
peso (Pendente a) = a
peso (Barra a b) = peso a + peso b

balanceado :: Mobile -> Bool
balanceado (Pendente a) = True
balanceado (Barra a b) = balanceado a && balanceado b && peso a == peso b