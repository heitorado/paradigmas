import Control.Concurrent
import Control.Concurrent.STM

type Buffer a = TVar [a]

newBuffer :: [a] -> IO (Buffer a)
newBuffer = newTVarIO

put :: Buffer a -> a -> STM()
put buf val = 
    do 
        xs <- readTVar buf
        writeTVar buf (val:xs)

get :: Buffer a -> STM a
get buf =
    do
        xs <- readTVar buf
        if null xs
        then retry
        else return(head xs)