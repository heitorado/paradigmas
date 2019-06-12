import Control.Concurrent.STM
import Control.Concurrent.STM.TVar
import Control.Concurrent
import Control.Monad
import System.IO

type FoodDispenser = (TVar Int, String)

type Knife = TVar Bool

dispenserReplenisherWorker :: MVar Int -> [FoodDispenser] -> IO()
dispenserReplenisherWorker qtdSandwiches dispensers = 
    do
        sandwiches <- readMVar qtdSandwiches
        if(sandwiches > 0) then
            do
                replenishDispenser (dispensers!!0)
                replenishDispenser (dispensers!!1)
                replenishDispenser (dispensers!!2)
                dispenserReplenisherWorker qtdSandwiches dispensers
        else
            return ()

replenishDispenser :: FoodDispenser -> IO()
replenishDispenser (tint, str) =
    do
        atomically( do writeTVar tint 30 )
        putStrLn (str++" reabastecido")
    

assemblySandwichWorker :: MVar Int -> Knife -> FoodDispenser -> FoodDispenser -> FoodDispenser -> IO()
assemblySandwichWorker sandwichesToMake k meatDisp tomatoDisp breadDisp =
    do
        atomically( do
                    getKnife(k)
                    prepareSandwich k meatDisp tomatoDisp breadDisp
                )
        sandwiches <- takeMVar sandwichesToMake
        if(sandwiches-1 >= 0) then
            do
                putStrLn ("+1 Sanduiche feito, restam "++(show(sandwiches-1)))
                putMVar sandwichesToMake (sandwiches-1)
                assemblySandwichWorker sandwichesToMake k meatDisp tomatoDisp breadDisp
        else 
            do
                putMVar sandwichesToMake sandwiches
                return ()

getKnife :: Knife -> STM()
getKnife k =
    do 
        lockKnife <- readTVar k
        if lockKnife
        then writeTVar k False
        else retry

dropKnife :: Knife -> STM()
dropKnife k = do( writeTVar k True )

prepareSandwich :: Knife -> FoodDispenser -> FoodDispenser -> FoodDispenser -> STM()
prepareSandwich k meatDisp tomatoDisp breadDisp =
    do 
        meat <- readTVar(fst meatDisp)
        tomato <- readTVar(fst tomatoDisp)
        bread <- readTVar(fst breadDisp)

        if(meat > 0)
        then writeTVar (fst meatDisp)    (meat-1)
        else retry
        
        if(tomato > 0)
        then writeTVar (fst tomatoDisp)  (tomato-1)
        else retry

        if(bread > 0)
        then writeTVar (fst breadDisp)  (bread-1)
        else retry

        dropKnife(k)

waitThreads :: MVar Int -> IO ()
waitThreads qtd = 
    do
        qtdAtual <- takeMVar qtd
        if(qtdAtual > 0) then
            do
                putMVar qtd qtdAtual
                waitThreads qtd
        else
            return ()
        

main = do
    qtdSanduiches <- newMVar 5000;
    
    knife <- atomically (newTVar True)
    bread <- atomically (newTVar 30)
    meat <- atomically (newTVar 30)
    tomato <- atomically (newTVar 30)

    let foodDispensers = [(bread, "Pão"), (meat, "Carne"), (tomato, "Tomate")]
    
    forkIO (assemblySandwichWorker qtdSanduiches knife (foodDispensers!!0) (foodDispensers!!1) (foodDispensers!!2))
    forkIO (assemblySandwichWorker qtdSanduiches knife (foodDispensers!!0) (foodDispensers!!1) (foodDispensers!!2))
    forkIO (dispenserReplenisherWorker qtdSanduiches foodDispensers)

    waitThreads(qtdSanduiches)
