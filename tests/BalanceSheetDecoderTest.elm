module BalanceSheetDecoderTest exposing (suite)

import BalanceSheetDecoder exposing (..)
import ElmTestBDDStyle exposing (..)
import Expect exposing (equal)
import Json.Decode exposing (decodeString)
import Model exposing (..)
import Test exposing (..)
import Time


suite : Test
suite =
    describe "BalanceSheetDecoder"
        [ it "decodes one asset row in JSON form" <|
            let
                json =
                    "{\"assets\": [{\"lastUpdated\": 1484298000000, \"institution\": \"institution name\", \"account\": \"account name\", \"investment\": \"investment name\", \"owner\": \"owner name\", \"value\": 1002.34}], \"liabilities\": []}"

                assets =
                    [ BalanceSheetRow (Time.millisToPosix 1484298000000) "institution name" "account name" "investment name" "owner name" 1002.34 ]
            in
            expect (decodeString balanceSheetDecoder json) to equal (Ok (BalanceSheet assets []))
        , it "decodes one liability row in JSON form" <|
            let
                json =
                    "{\"liabilities\": [{\"lastUpdated\": 1584298000000, \"institution\": \"institution name\", \"account\": \"account name\", \"investment\": \"investment name\", \"owner\": \"owner name\", \"value\": 1002.34}], \"assets\": []}"

                liabilities =
                    [ BalanceSheetRow (Time.millisToPosix 1584298000000) "institution name" "account name" "investment name" "owner name" 1002.34 ]
            in
            expect (decodeString balanceSheetDecoder json) to equal (Ok (BalanceSheet [] liabilities))
        , it "decodes two balance sheet rows in JSON form" <|
            let
                json =
                    "{\"assets\": [{\"lastUpdated\": 1584298000300, \"institution\": \"institution one\", \"account\": \"account one\", \"investment\": \"investment one\", \"owner\": \"owner one\", \"value\": 102.34}, {\"lastUpdated\": 1584298000002, \"institution\": \"institution two\", \"account\": \"account two\", \"investment\": \"investment two\", \"owner\": \"owner two\", \"value\": 29}], \"liabilities\": []}"

                assets =
                    [ BalanceSheetRow (Time.millisToPosix 1584298000300) "institution one" "account one" "investment one" "owner one" 102.34
                    , BalanceSheetRow (Time.millisToPosix 1584298000002) "institution two" "account two" "investment two" "owner two" 29
                    ]
            in
            expect (decodeString balanceSheetDecoder json) to equal (Ok (BalanceSheet assets []))
        ]
