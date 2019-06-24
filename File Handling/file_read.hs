import System.Environment
import System.IO
import Data.List
import Data.Maybe


wordsWhen:: (Char -> Bool) -> String -> [String]
wordsWhen p s =  case dropWhile p s of
                      "" -> []
                      s' -> w : wordsWhen p s''
                            where (w, s'') = break p s'

shouldProcessLine:: String -> Bool
shouldProcessLine l = isPrefixOf "//-" l

identifyCommand:: [String] -> Integer
identifyCommand [x1,x2] | x1 == "!class" && x2 == "declaration" = 1
identifyCommand l = 0


tokenizeCommand:: Maybe String -> Integer
tokenizeCommand (Nothing) = 0 
tokenizeCommand (Just s) = identifyCommand $ wordsWhen (==' ') s

identifyStateFromIdle:: String -> Integer
identifyStateFromIdle l | shouldProcessLine l == True = tokenizeCommand (stripPrefix "//-" l)
identifyStateFromIdle l = 0 

identifyStateFromClassDeclaration:: String -> Integer
identifyStateFromClassDeclaration l = if shouldProcessLine l then 1 else 0

stateMachine:: Integer -> String -> Integer
stateMachine 0 l = identifyStateFromIdle l
stateMachine 1 l = identifyStateFromClassDeclaration l
stateMachine n l = 0

processLines:: Handle -> Bool -> Integer -> IO()
processLines fh end state | end == False = do
                                                l <- hGetLine fh
                                                print l
                                                print $ stateMachine state l
                                                end <- hIsEOF fh
                                                processLines fh end (stateMachine state l)
                          | end == True   = print "Finished!"

processFile:: String -> IO()
processFile filename = do
    fh <- openFile filename ReadMode
    end <- hIsEOF fh
    processLines fh end 0
    hClose fh

data ClassDeclaration a = ClassDeclaration {
                        name:: String, 
                        base_name:: String,
                        attributes::  [String]} 
                        deriving (Show)

c = ClassDeclaration "Point" "Object" ["int x", "int y"]

main:: IO()
main = do
    [f]  <- getArgs
    print f
    processFile f