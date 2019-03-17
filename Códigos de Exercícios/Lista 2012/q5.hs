agrupar :: Eq a => [a] -> [[a]]
agrupar [] = []
agrupar (x:xs) = 
    let reducedList = filter(/= x) (xs)
        listOfEquals = filter(==x) (x:xs)
    in listOfEquals : agrupar(reducedList)

