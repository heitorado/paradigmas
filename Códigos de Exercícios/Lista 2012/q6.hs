divide ::(a->Bool)->[a]->([a],[a])
divide _ [] = ([],[])
divide f xs = 
    let x = filter(not.f)(xs) 
        y = filter(f)(xs)
    in (x,y)
