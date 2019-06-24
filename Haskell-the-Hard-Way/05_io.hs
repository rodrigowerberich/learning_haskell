import System.Environment 
-- import Data.Maybe

convertList:: [String] -> [Integer]
convertList l = map read l

main = do
    args <- getArgs
    print $ sum $ convertList args