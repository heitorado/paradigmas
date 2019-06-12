import Control.Concurrent.STM
import Control.Concurrent.STM.TVar
import Control.Concurrent
import Control.Monad
import System.IO

type Semaphore = TVar Bool

p::Semaphore -> STM()
p sem = do {
                lock <- readTVar sem;
                if lock 
                then writeTVar sem False
                else retry
            }

v::Semaphore -> STM()
v sem = do writeTVar sem True