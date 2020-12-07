import Test.HUnit
import Day2 (t1, t2)
import qualified Data.Text as Text

main :: IO Counts
main = runTestTT tests

example = Text.pack "1-3 a: abcde\n1-3 b: cdefg\n2-9 c: ccccccccc"

task1 = TestCase (assertEqual "renders correct answer" "2 passwords valid" (t1 example))

task2 = TestCase (assertEqual "renders correct answer" "1 passwords valid" (t2 example))

tests = TestList [ TestLabel "Task 1" task1
                 , TestLabel "Task 2" task2 ]
