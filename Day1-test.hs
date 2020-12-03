import Test.HUnit
import Day1
import qualified Data.Text as Text

example = Text.pack "1721\n979\n366\n299\n675\n1456"

task1 = TestCase (assertEqual "renders correct answer" "Pairs that add up to 2020:\n299 * 1721 = 514579" (Day1.t1 example))

task2 = TestCase (assertEqual "renders correct answer" "Triples that add up to 2020:\n366 * 675 * 979 = 241861950" (Day1.t2 example))

brokenExample = Text.pack "1721\n979x\n111"

checkInput = TestCase (assertEqual "doesn't like the input" "The input needs to contain exactly one integer per line" (Day1.t1 brokenExample))

tests = TestList [ TestLabel "Task 1" task1
                 , TestLabel "Task 2" task2
                 , TestLabel "Check Input" checkInput ]
