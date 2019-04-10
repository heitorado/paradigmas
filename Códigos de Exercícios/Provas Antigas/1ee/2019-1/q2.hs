-- 2A
type City = String
data TrainClass = First | Second deriving(Show)
data PlaneClass = Economic | Executive deriving(Show)
data Ticket = Train City City TrainClass | Bus City City | Plane City City PlaneClass

instance Show(Ticket) where
    show(Train city1 city2 tclass) = "Train choo-chooing from " ++ city1 ++ " to " ++ city2 ++ " on " ++ show(tclass) ++ " class"
    show(Bus city1 city2) = "Bus driving from " ++ city1 ++ " to " ++ city2
    show(Plane city1 city2 pclass) = "Plane flying from " ++ city1 ++ " to " ++ city2 ++ " on " ++ show(pclass) ++ " class"

-- 2B
getOrigin :: Ticket -> City
getOrigin (Train o _ _) = o
getOrigin (Bus o _) = o
getOrigin (Plane o _ _) = o

getDestination :: Ticket -> City
getDestination (Train _ d _) = d
getDestination (Bus _ d) = d
getDestination (Plane _ d _) = d

valida :: [Ticket] -> Bool
valida [] = True
valida (a:[]) = True
valida (a:(b:xs)) = (getDestination(a) == getOrigin(b)) && valida(xs)

-- Tests:
-- (Train "Bauru" "Campinas" First)
-- (Bus "Campinas" "Sao Paulo")
-- (Plane "Sao Paulo" "Recife" Executive)

-- valida[(Train "Bauru" "Campinas" First)]
    -- should be True
-- valida[(Train "Bauru" "Campinas" First),(Bus "Campinas" "Sao Paulo"),(Plane "Sao Paulo" "Recife" Executive)]
    -- should be True
-- valida[(Train "Bauru" "Campinas" First),(Bus "Campinas" "Sao Paulo"),(Plane "Sao Paulo" "Recife" Executive),(Plane "Recife" "Boston" Economic)]
    -- should be True
-- valida[(Train "Bauru" "Campinas" First),(Bus "Campinas" "Sao Paulo"),(Plane "Sao Paulo" "Recife" Executive),(Plane "Orlando" "Boston" Economic)]
    -- should be False
