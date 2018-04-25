module UpdateTest exposing (suite)

import ElmTestBDDStyle exposing (..)
import Test exposing (..)
import Expect exposing (equal)
import Model exposing (..)
import Date.Extra exposing (fromParts)
import Date exposing (Month(..))
import Update exposing (update)
import Http
import Navigation exposing (Location)


mockLocation : String -> Location
mockLocation endpoint =
    (Location "" "" "" "" "" "" "" "" endpoint "" "")


initialModel : Model
initialModel =
    (Model (BalanceSheet [] []) "some/url" HomeRoute)


suite : Test
suite =
    describe "Update"
        [ describe "UrlChange"
            [ it "changes the route" <|
                let
                    msg =
                        UrlChange (mockLocation "#balance_sheet")

                    ( newModel, newMsg ) =
                        update msg initialModel
                in
                    expect newModel.route to equal BalanceSheetRoute
            , it "returns a command of Cmd.none" <|
                let
                    msg =
                        UrlChange (mockLocation "#balance_sheet")

                    ( newModel, newMsg ) =
                        update msg initialModel
                in
                    expect newMsg to equal Cmd.none
            ]
        , describe "BalanceSheet"
            [ it "updates the balance sheet with new data" <|
                let
                    newBalanceSheet =
                        (BalanceSheet [ (BalanceSheetRow (fromParts 1 Jan 1 0 0 0 0) "" "" "" "" 0.0) ] [])

                    httpResponse =
                        (Ok newBalanceSheet)

                    ( newModel, newMsg ) =
                        update (UpdateBalanceSheet httpResponse) initialModel
                in
                    expect newModel to equal (Model newBalanceSheet "some/url" HomeRoute)
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
                        (BalanceSheet [] [ (BalanceSheetRow (fromParts 1 Jan 1 0 0 0 0) "" "" "" "" 0.0) ])

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
