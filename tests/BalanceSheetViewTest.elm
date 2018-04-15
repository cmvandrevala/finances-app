module BalanceSheetViewTest exposing (..)

import ElmTestBDDStyle exposing (..)
import BalanceSheetView exposing (view)
import Model exposing (..)
import Test exposing (..)
import Test.Html.Query as Query
import Test.Html.Selector exposing (class, text, tag)
import ElmTestBDDStyle exposing (..)
import Expect


suite : Test
suite =
    describe "the balance sheet view"
        [ it "has a title of Balance Sheet" <|
            ((view initialModel)
                |> Query.fromHtml
                |> Query.find [ tag "h1" ]
                |> Query.has [ text "Balance Sheet" ]
            )
        , it "displays the last updated header" <|
            ((view initialModel)
                |> Query.fromHtml
                |> Query.findAll [ class "last-updated-header" ]
                |> Query.count (Expect.equal 1)
            )
        , it "displays the institution header" <|
            ((view initialModel)
                |> Query.fromHtml
                |> Query.findAll [ class "institution-header" ]
                |> Query.count (Expect.equal 1)
            )
        , it "displays the account header" <|
            ((view initialModel)
                |> Query.fromHtml
                |> Query.findAll [ class "account-header" ]
                |> Query.count (Expect.equal 1)
            )
        , it "displays the investment header" <|
            ((view initialModel)
                |> Query.fromHtml
                |> Query.findAll [ class "investment-header" ]
                |> Query.count (Expect.equal 1)
            )
        , it "displays the owner header" <|
            ((view initialModel)
                |> Query.fromHtml
                |> Query.findAll [ class "owner-header" ]
                |> Query.count (Expect.equal 1)
            )
        , it "displays the value header" <|
            ((view initialModel)
                |> Query.fromHtml
                |> Query.findAll [ class "value-header" ]
                |> Query.count (Expect.equal 1)
            )
        ]
