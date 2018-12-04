module Main where

import           Test.Tasty
import           Test.Tasty.HUnit
import           Test.Tasty.Ingredients
import           Test.Tasty.Options
import           Test.Tasty.Runners
import           Test.Tasty.Runners.AntXML
import           Test.Tasty.Runners.Html

--  ------------------------------------------------------------------- [ Main ]

main :: IO ()
main = defaultMainWithIngredients myIngredients $
  testGroup "Private Internal Test Suite Two"
            [internalTests]

myIngredients :: [Ingredient]
myIngredients =  [composeReporters consoleTestReporter $ composeReporters htmlRunner antXMLRunner]
              ++ defaultIngredients


internalTests :: TestTree
internalTests =
  testGroup
    "Testing Internals"
    [exampleTests1, exampleTests2]


exampleTests1 :: TestTree
exampleTests1 =
  testGroup
    "Testing Command Execution 1"
    [
      testCase "Failing Test" (assertEqual "" False True)
    , testCase "Passing Test" (assertEqual "" True True)
    ]

exampleTests2 :: TestTree
exampleTests2 =
  testGroup
    "Testing Command Execution 2"
    [
      testCase "Failing Test" (assertEqual ""False True)
    , testCase "Passing Test" (assertEqual ""True True)
    ]
