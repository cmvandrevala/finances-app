module ViewTest exposing (suite)

import ElmTestBDDStyle exposing (..)
import Test exposing (..)


-- import Expect exposing (equal)

import Model exposing (..)
import View exposing (view)
import Test.Html.Query as Query
import Test.Html.Selector exposing (text, tag)


model : Route -> Model
model route =
    (Model (BalanceSheet [] []) "some/url" route)


suite : Test
suite =
    describe "View"
        [ it "displays the home page" <|
            ((view (model HomeRoute))
                |> Query.fromHtml
                |> Query.find [ tag "h1" ]
                |> Query.has [ text "Home" ]
            )
        , it "displays the balance sheet" <|
            ((view (model BalanceSheetRoute))
                |> Query.fromHtml
                |> Query.find [ tag "h1" ]
                |> Query.has [ text "Balance Sheet" ]
            )
        , it "displays a 404 page" <|
            ((view (model NotFoundRoute))
                |> Query.fromHtml
                |> Query.find [ tag "h1" ]
                |> Query.has [ text "Not Found" ]
            )
        ]
