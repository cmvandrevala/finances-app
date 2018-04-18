module UpdateTest exposing (suite)

import ElmTestBDDStyle exposing (..)
import Test exposing (..)
import Expect exposing (equal)
import Model exposing (..)
import Date.Extra exposing (fromParts)
import Date exposing (Month(..))
import Update exposing (update)
import Http


suite : Test
suite =
    describe "Update"
        [ describe "BalanceSheet"
            [ it "updates the balance sheet with new data" <|
                let
                    newBalanceSheet =
                        (BalanceSheet [ (BalanceSheetRow (fromParts 1 Jan 1 0 0 0 0) "" "" "" "" 0.0) ])

                    httpResponse =
                        (Ok newBalanceSheet)

                    ( newModel, newMsg ) =
                        update (UpdateBalanceSheet httpResponse) initialModel
                in
                    expect newModel to equal (Model newBalanceSheet)
            , it "does not update the balance sheet if it receives an error" <|
                let
                    httpResponse =
                        (Err Http.NetworkError)

                    ( newModel, newMsg ) =
                        update (UpdateBalanceSheet httpResponse) initialModel
                in
                    expect newModel to equal initialModel
            , it "returns Cmd.none as a message for a successful response" <|
                let
                    newBalanceSheet =
                        (BalanceSheet [ (BalanceSheetRow (fromParts 1 Jan 1 0 0 0 0) "" "" "" "" 0.0) ])

                    httpResponse =
                        (Ok newBalanceSheet)

                    ( newModel, newMsg ) =
                        update (UpdateBalanceSheet httpResponse) initialModel
                in
                    expect newMsg to equal Cmd.none
            , it "returns Cmd.none as a message for an unsuccessful response" <|
                let
                    httpResponse =
                        (Err Http.NetworkError)

                    ( newModel, newMsg ) =
                        update (UpdateBalanceSheet httpResponse) initialModel
                in
                    expect newMsg to equal Cmd.none
            ]
        ]
