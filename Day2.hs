module Day2
( t1
, t2
, main
) where
import qualified Data.Text as Text
import qualified Data.Text.IO as Text
import qualified Data.Text.Read as Text
import Control.Monad (unless)
import Data.Char (isDigit, isLetter)
import Data.List (elemIndices)
import qualified Text.ParserCombinators.ReadP as ReadP

main :: IO ()
main = do
  input <- Text.readFile "Day2.txt"
  putStrLn (t1 input ++ "\n" ++ t2 input)

t1 :: Text.Text -> String
t1 bar = case parseInput bar of Left msg -> msg
                                Right list -> show (count isValidT1 list) ++ " passwords valid"

t2 :: Text.Text -> String
t2 bar = case parseInput bar of Left msg -> msg
                                Right list -> show (count isValidT2 list) ++ " passwords valid"

isValidT1 :: (Int, Int, Char, String) -> Bool
isValidT1 (min, max, code, password) = min <= num && num <= max
  where num = length (elemIndices code password)

isValidT2 :: (Int, Int, Char, String) -> Bool
isValidT2 (pos1, pos2, code, password) = (password !! (pos1 - 1) == code) /= (password !! (pos2 - 1) == code)

count :: (a -> Bool) -> [a] -> Int
count xs = length . filter xs

parseInput :: Text.Text -> Either String [(Int, Int, Char, String)]
parseInput input = traverse (parseMaybe parsePasswordPolicy) $ Text.lines input

parseMaybe :: ReadP.ReadP a -> Text.Text -> Either String a
parseMaybe parser input =
  case ReadP.readP_to_S parser (Text.unpack input) of
    [] -> Left "Could not parse"
    ((result, _):_) -> Right result

parsePasswordPolicy :: ReadP.ReadP (Int, Int, Char, String)
parsePasswordPolicy = do
  min <- parseNumber
  skipStringSurroundedByWhitespace "-"
  max <- parseNumber
  ReadP.skipSpaces
  code <- parseChar
  skipStringSurroundedByWhitespace ":"
  input <- parseString
  ReadP.eof
  return (min, max, code, input)

skipStringSurroundedByWhitespace :: String -> ReadP.ReadP ()
skipStringSurroundedByWhitespace f = do
  ReadP.skipSpaces
  ReadP.string f
  ReadP.skipSpaces

parseChar :: ReadP.ReadP Char
parseChar = ReadP.satisfy isLetter

parseNumber :: ReadP.ReadP Int
parseNumber = fmap read (ReadP.many1 (ReadP.satisfy isDigit))

parseString :: ReadP.ReadP String
parseString = ReadP.many1 (ReadP.satisfy isLetter)
