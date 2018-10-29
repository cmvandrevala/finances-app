module RoutingTest exposing (suite)

import ElmTestBDDStyle exposing (..)
import Expect exposing (equal)
import Model exposing (..)
import Navigation exposing (Location)
import Routing exposing (parseLocation)
import Test exposing (..)


mockLocation : String -> Location
mockLocation endpoint =
    Location "" "" "" "" "" "" "" "" endpoint "" ""


suite : Test
suite =
    describe "Routing"
        [ it "routes a user to the home page" <|
            expect (parseLocation (mockLocation "#home")) to equal HomeRoute
        , it "routes a user to the balance sheet page" <|
            expect (parseLocation (mockLocation "#balance_sheet")) to equal BalanceSheetRoute
        , it "routes a user to the upcoming expenses page" <|
            expect (parseLocation (mockLocation "#upcoming_expenses")) to equal UpcomingExpensesRoute
        , it "returns a NotFoundRoute" <|
            expect (parseLocation (mockLocation "#some_random_route")) to equal NotFoundRoute
        ]
