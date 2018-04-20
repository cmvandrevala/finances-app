module BalanceSheetDecoderTest exposing (suite)

import Date exposing (Date, Month(..))
import Date.Extra exposing (fromParts)
import ElmTestBDDStyle exposing (..)
import Test exposing (..)
import Json.Decode exposing (decodeString)
import Model exposing (..)
import BalanceSheetDecoder exposing (..)
import Expect exposing (equal)


lastUpdated : Date
lastUpdated =
    fromParts 2017 Oct 3 0 0 0 0


suite : Test
suite =
    describe "BalanceSheetDecoder"
        [ it "decodes one asset row in JSON form" <|
            let
                json =
                    "{\"assets\": [{\"lastUpdated\": \"2017-10-03T00:00:00-05:00\", \"institution\": \"institution name\", \"account\": \"account name\", \"investment\": \"investment name\", \"owner\": \"owner name\", \"value\": 1002.34}], \"liabilities\": []}"

                assets =
                    [ (BalanceSheetRow lastUpdated "institution name" "account name" "investment name" "owner name" 1002.34) ]
            in
                expect (decodeString balanceSheetDecoder json) to equal (Ok (BalanceSheet assets []))
        , it "decodes one liability row in JSON form" <|
            let
                json =
                    "{\"liabilities\": [{\"lastUpdated\": \"2017-10-03T00:00:00-05:00\", \"institution\": \"institution name\", \"account\": \"account name\", \"investment\": \"investment name\", \"owner\": \"owner name\", \"value\": 1002.34}], \"assets\": []}"

                liabilities =
                    [ (BalanceSheetRow lastUpdated "institution name" "account name" "investment name" "owner name" 1002.34) ]
            in
                expect (decodeString balanceSheetDecoder json) to equal (Ok (BalanceSheet [] liabilities))
        , it "decodes two balance sheet rows in JSON form" <|
            let
                json =
                    "{\"assets\": [{\"lastUpdated\": \"2018-11-23T00:00:00-06:00\", \"institution\": \"institution one\", \"account\": \"account one\", \"investment\": \"investment one\", \"owner\": \"owner one\", \"value\": 102.34}, {\"lastUpdated\": \"2013-02-06T00:00:00-06:00\", \"institution\": \"institution two\", \"account\": \"account two\", \"investment\": \"investment two\", \"owner\": \"owner two\", \"value\": 29}], \"liabilities\": []}"

                assets =
                    [ (BalanceSheetRow (fromParts 2018 Nov 23 0 0 0 0) "institution one" "account one" "investment one" "owner one" 102.34)
                    , (BalanceSheetRow (fromParts 2013 Feb 6 0 0 0 0) "institution two" "account two" "investment two" "owner two" 29)
                    ]
            in
                expect (decodeString balanceSheetDecoder json) to equal (Ok (BalanceSheet assets []))
        , it "returns an error for an invalid date format" <|
            let
                json =
                    "{\"assets\": [{\"lastUpdated\": \"invalid!!!\", \"institution\": \"institution one\", \"account\": \"account one\", \"investment\": \"investment one\", \"owner\": \"owner one\", \"value\": 102.34}], \"liabilities\": []}"

                expectedMessage =
                    "I ran into a `fail` decoder at _.assets[0].lastUpdated: Unable to parse 'invalid!!!' as a date. Dates must be in the ISO 8601 format."
            in
                expect (decodeString balanceSheetDecoder json) to equal (Err expectedMessage)
        , it "returns an error for invalid JSON" <|
            let
                json =
                    "{\"invalid\": \"json\"}"

                expectedMessage =
                    "Expecting an object with a field named `assets` but instead got: {\"invalid\":\"json\"}"
            in
                expect (decodeString balanceSheetDecoder json) to equal (Err expectedMessage)
        ]
