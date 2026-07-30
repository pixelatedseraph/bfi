module Main where

import System.FilePath hiding (hasExtension)
import System.Directory (doesFileExist)
import System.Exit
import System.Environment (getArgs)
import Data.List (isSuffixOf)

generateCHeader :: String
generateCHeader = "#include<stdio.h>\n"

generateTape :: String
generateTape = "unsigned char tape[30000] = {0};\n"

beginCMain :: String
beginCMain  = "int main(){\n";

generatePointer :: String
generatePointer = "unsigned char* restrict p = tape;\n"

endCMain :: String
endCMain = "return 0; }\n";

translateChar :: Char -> String
translateChar ch
    | ch == '+' = "++(*p);\n"
    | ch == '-' = "--(*p);\n"
    | ch == '>' = "++p;\n"
    | ch == '<' = "--p;\n"
    | ch == '.' = "putchar(*p);\n"
    | ch == ',' = "*p = getchar();\n"
    | ch == '[' = "while(*p){\n"
    | ch == ']' = "}\n"
    | otherwise = ""

translateSource :: String -> String
translateSource src = concat $ map translateChar src

generateCSource :: String -> String
generateCSource sourceCocde =
    generateCHeader 
    ++ generateTape
    ++ beginCMain
    ++ generatePointer
    ++ translateSource sourceCocde
    ++ endCMain


hasExtension :: String -> String -> Bool
hasExtension ext filename = ext `isSuffixOf` filename

main :: IO ()
main = do
    args <- getArgs
    let bfSourceFile = args !! 0
    exists <- doesFileExist bfSourceFile
    if not exists
        then exitWith (ExitFailure 1)
        else if not (hasExtension ".bf" bfSourceFile)
            then exitWith (ExitFailure 2)
            else do
                content <- readFile bfSourceFile
                let emittedC = generateCSource content
                writeFile (replaceExtension bfSourceFile "c") emittedC
    