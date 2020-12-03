module Day1
( t1
, t2
) where
import qualified Data.Text as Text
import qualified Data.Text.IO as Text
import qualified Data.Text.Read as Text
import Control.Monad (unless)

main :: IO ()
main = do
  input <- Text.readFile "Day1.txt"
  putStrLn ((t1 input) ++ "\n" ++ (t2 input))

t1 :: Text.Text -> String
t1 bar = case parsed of (Left msg) -> msg
                        (Right list) -> showListOfPairs (pairsAddingUpTo2020 list)
  where parsed = parseInput bar

t2 :: Text.Text -> String
t2 bar = case parsed of (Left msg) -> msg
                        (Right list) -> showListOfTriples (triplesAddingUpTo2020 list)
  where parsed = parseInput bar

showListOfTriples :: (Show a, Num a) => [(a, a, a)] -> [Char]
showListOfTriples [] = "No Result found"
showListOfTriples xs = "Triples that add up to 2020:\n" ++ (showResults_ xs)
  where showResults_ [(a, b, c)] = (show a) ++ " * " ++ (show b) ++ " * " ++ (show c) ++ " = " ++ show (a * b * c)
        showResults_ (k:ks) = showResults_ [k] ++ "\n" ++ showResults_ ks

showListOfPairs :: (Show a, Num a) => [(a, a)] -> [Char]
showListOfPairs [] = "No Result found"
showListOfPairs xs = "Pairs that add up to 2020:\n" ++ (showResults_ xs)
  where showResults_ [(a, b)] = (show a) ++ " * " ++ (show b) ++ " = " ++ show (a * b)
        showResults_ (k:ks) = showResults_ [k] ++ "\n" ++ showResults_ ks

pairsAddingUpTo2020 :: (Ord a, Num a) => [a] -> [(a, a)]
pairsAddingUpTo2020 xs = [(x, y) | x <- xs, y <- xs, x < y, x + y == 2020]

triplesAddingUpTo2020 :: (Ord a, Num a) => [a] -> [(a, a, a)]
triplesAddingUpTo2020 xs = [(x, y, z) | x <- xs, y <- xs, z <- xs, x < y, y < z, x + y + z == 2020]

parseInput :: (Integral a) => Text.Text -> Either String [a]
parseInput xs = sequence $ map (runParse Text.decimal) $ Text.lines xs

runParse :: (Text.Reader a) -> Text.Text -> Either String a
runParse reader input = do
  (a, rest) <- reader input
  unless (Text.null rest) $ Left "The input needs to contain exactly one integer per line"
  return a
