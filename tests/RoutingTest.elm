module RoutingTest exposing (suite)

import ElmTestBDDStyle exposing (expect, it, to)
import Expect exposing (equal)
import Model exposing (Route(..))
import Routing exposing (..)
import Test exposing (Test, describe)
import Url


suite : Test
suite =
    describe "fromUrl"
        [ it "routes a user to the home page" <|
            expect (fromUrl homeUrl) to equal HomeRoute
        , it "routes a user to the balance sheet page" <|
            expect (fromUrl balanceSheetUrl) to equal BalanceSheetRoute
        , it "routes a user to the upcoming expenses page" <|
            expect (fromUrl upcomingExpensesUrl) to equal UpcomingExpensesRoute
        , it "returns a NotFoundRoute" <|
            expect
                (fromUrl
                    { protocol = Url.Http
                    , host = "localhost"
                    , port_ = Nothing
                    , path = "not_found"
                    , query = Nothing
                    , fragment = Nothing
                    }
                )
                to
                equal
                NotFoundRoute
        ]
