module RoutingTest exposing (suite)

import ElmTestBDDStyle exposing (..)
import Test exposing (..)
import Expect exposing (equal)
import Routing exposing (parseLocation)
import Navigation exposing (Location)
import Model exposing (..)


mockLocation : String -> Location
mockLocation endpoint =
    (Location "" "" "" "" "" "" "" "" endpoint "" "")


suite : Test
suite =
    describe "Routing"
        [ it "routes a user to the home page" <|
            expect (parseLocation (mockLocation "#home")) to equal HomeRoute
        , it "routes a user to the balance sheet page" <|
            expect (parseLocation (mockLocation "#balance_sheet")) to equal BalanceSheetRoute
        , it "returns a NotFoundRoute" <|
            expect (parseLocation (mockLocation "#some_random_route")) to equal NotFoundRoute
        ]
