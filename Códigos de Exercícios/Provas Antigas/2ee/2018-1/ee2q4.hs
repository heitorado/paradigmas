import Control.Concurrent
import Control.Concurrent.STM

type Buffer a = TVar [a]

newBuffer :: [a] -> IO (Buffer a)
newBuffer = newTVarIO

put :: Buffer a -> a -> STM ()
put buffer a = do
    content <- readTVar buffer
    writeTVar buffer (a:content)

get :: Buffer a -> STM a
get buffer = do
    a <- readTVar buffer
    if null a
        then retry
        else return (head a)

consumer :: Buffer Int -> IO ()
consumer buffer = do
    threadDelay 500000
    a <- atomically (get buffer)
    print a
    consumer buffer

producer :: Buffer Int -> Int -> IO ()
producer buffer a = do
    threadDelay 1000000
    atomically (put buffer a)
    producer buffer (a + 1)
                    
main :: IO ()
main = do
    buffer <- newBuffer []
    forkIO $ consumer buffer
    forkIO $ producer buffer 0
    readLn
