# Advent of Code 2020

Me, trying to solve [a few puzzles](https://adventofcode.com) in Haskell

## Running the Code

We use day 1 as an example here, this can be used for each day:

* `runghc Day.hs` to run the code
* `runghc Day-test.hs` to run the tests

To do it interactively, start `ghci`, then run:

* `:l Day1-test.hs` and `runTestTT tests` to run the tests
* `:l Day1.hs` and `Day1.main` to run the code

I'm also using [hlint](https://github.com/ndmitchell/hlint) to check for suggestions.

## Day 1

Given a text file (`Day1.txt`) that contains an integer in each line:

* **Task 1:** Find a pair of numbers that adds up to 2020, the result is their product
* **Task 2:** Find a triple of numbers that adds up to 2020, the result is their product
