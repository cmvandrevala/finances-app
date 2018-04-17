module BalanceSheetRowDecoderTest exposing (suite)

import Date exposing (Date, Month(..))
import Date.Extra exposing (fromParts)
import ElmTestBDDStyle exposing (..)
import Test exposing (..)
import Json.Decode exposing (decodeString)
import Model exposing (..)
import BalanceSheetRowDecoder exposing (balanceSheetRowDecoder)
import Expect exposing (equal)


lastUpdated : Date
lastUpdated =
    fromParts 2017 Oct 3 0 0 0 0


suite : Test
suite =
    describe "BalanceSheetRowDecoder"
        [ it "decodes a balance sheet row in JSON form" <|
            let
                json =
                    "{\"lastUpdated\": \"2017-10-03T00:00:00-05:00\", \"institution\": \"institution name\", \"account\": \"account name\", \"investment\": \"investment name\", \"owner\": \"owner name\", \"value\": 1002.34}"
            in
                expect (decodeString balanceSheetRowDecoder json) to equal (Ok (BalanceSheetRow lastUpdated "institution name" "account name" "investment name" "owner name" 1002.34))
        ]
