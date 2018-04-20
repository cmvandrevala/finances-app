module DateFormatterTest exposing (suite)

import ElmTestBDDStyle exposing (..)
import Test exposing (..)
import Expect exposing (equal)
import Date exposing (Month(..))
import DateFormatter exposing (formatMonth)


suite : Test
suite =
    describe "formatting the month"
        [ it "formats the month of January" <|
            expect (formatMonth Jan) to equal "01"
        , it "formats the month of February" <|
            expect (formatMonth Feb) to equal "02"
        , it "formats the month of March" <|
            expect (formatMonth Mar) to equal "03"
        , it "formats the month of April" <|
            expect (formatMonth Apr) to equal "04"
        , it "formats the month of May" <|
            expect (formatMonth May) to equal "05"
        , it "formats the month of June" <|
            expect (formatMonth Jun) to equal "06"
        , it "formats the month of July" <|
            expect (formatMonth Jul) to equal "07"
        , it "formats the month of August" <|
            expect (formatMonth Aug) to equal "08"
        , it "formats the month of September" <|
            expect (formatMonth Sep) to equal "09"
        , it "formats the month of October" <|
            expect (formatMonth Oct) to equal "10"
        , it "formats the month of November" <|
            expect (formatMonth Nov) to equal "11"
        , it "formats the month of December" <|
            expect (formatMonth Dec) to equal "12"
        ]
