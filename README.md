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

## Day 2

Given a text file (`Day2.txt`) that contains a list of password policies and passwords that look like this:

```
1-3 a: abcde
```

Where `1` is the first number, `3` is the second number, `a` is the character and `abcde` is the password. The task is to find the amount of passwords that are valid according to the policy. The policy is different between the two tasks:

* **Task 1:** There are between first number and second number of character in the password (in the example above, that would be at least 1 and at most 3 `a`s in `abcde`.
* **Task 2:** There is either character at the position described by the first number or the second number (but not both), where position is 1-indexed.
