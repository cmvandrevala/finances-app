module BalanceSheetViewTest exposing (suite)

import BalanceSheetView exposing (view)
import ElmTestBDDStyle exposing (expect, it, to)
import Expect
import Model exposing (BalanceSheet, BalanceSheetRow)
import Test exposing (Test, describe)
import Test.Html.Query as Query
import Test.Html.Selector exposing (class, tag, text)
import Time


balanceSheet : BalanceSheet
balanceSheet =
    BalanceSheet
        [ BalanceSheetRow
            (Time.millisToPosix 1484298000000)
            "institution one"
            "account one"
            "investment one"
            "owner one"
            100.23
        , BalanceSheetRow
            (Time.millisToPosix 1484298000000)
            "institution two"
            "account two"
            "investment two"
            "owner two"
            185
        ]
        [ BalanceSheetRow
            (Time.millisToPosix 1484298000000)
            "institution three"
            "account three"
            "investment three"
            "owner one"
            1.9
        , BalanceSheetRow
            (Time.millisToPosix 1484298000000)
            "institution two"
            "account two"
            "investment two"
            "owner two"
            98
        ]


suite : Test
suite =
    describe "the balance sheet view"
        [ it "has a title of Balance Sheet" <|
            (view balanceSheet
                |> Query.fromHtml
                |> Query.find [ tag "h1" ]
                |> Query.has [ text "Balance Sheet" ]
            )
        , it "has a button to refresh the balance sheet" <|
            (view balanceSheet
                |> Query.fromHtml
                |> Query.findAll [ class "get-balance-sheet" ]
                |> Query.count (Expect.equal 1)
            )
        , it "displays the last updated header for assets and liabilities" <|
            (view balanceSheet
                |> Query.fromHtml
                |> Query.findAll [ class "last-updated-header" ]
                |> Query.count (Expect.equal 2)
            )
        , it "displays the institution header for assets and liabilities" <|
            (view balanceSheet
                |> Query.fromHtml
                |> Query.findAll [ class "institution-header" ]
                |> Query.count (Expect.equal 2)
            )
        , it "displays the account header for assets and liabilities" <|
            (view balanceSheet
                |> Query.fromHtml
                |> Query.findAll [ class "account-header" ]
                |> Query.count (Expect.equal 2)
            )
        , it "displays the investment header for assets and liabilities" <|
            (view balanceSheet
                |> Query.fromHtml
                |> Query.findAll [ class "investment-header" ]
                |> Query.count (Expect.equal 2)
            )
        , it "displays the owner header for assets and liabilities" <|
            (view balanceSheet
                |> Query.fromHtml
                |> Query.findAll [ class "owner-header" ]
                |> Query.count (Expect.equal 2)
            )
        , it "displays the value header for assets and liabilities" <|
            (view balanceSheet
                |> Query.fromHtml
                |> Query.findAll [ class "value-header" ]
                |> Query.count (Expect.equal 2)
            )
        , it "displays each of the balance sheet rows for assets and liabilities" <|
            (view balanceSheet
                |> Query.fromHtml
                |> Query.findAll [ class "balance-sheet-row" ]
                |> Query.count (Expect.equal 4)
            )
        , it "displays a formatted last-updated date associated with a row" <|
            (view balanceSheet
                |> Query.fromHtml
                |> Query.findAll [ class "balance-sheet-row" ]
                |> Query.first
                |> Query.has [ text "2017-01-13" ]
            )
        , it "displays an institution associated with a row" <|
            (view balanceSheet
                |> Query.fromHtml
                |> Query.findAll [ class "balance-sheet-row" ]
                |> Query.first
                |> Query.has [ text "institution one" ]
            )
        , it "displays an account associated with a row" <|
            (view balanceSheet
                |> Query.fromHtml
                |> Query.findAll [ class "balance-sheet-row" ]
                |> Query.first
                |> Query.has [ text "account one" ]
            )
        , it "displays an investment associated with a row" <|
            (view balanceSheet
                |> Query.fromHtml
                |> Query.findAll [ class "balance-sheet-row" ]
                |> Query.first
                |> Query.has [ text "investment one" ]
            )
        , it "displays an owner associated with a row" <|
            (view balanceSheet
                |> Query.fromHtml
                |> Query.findAll [ class "balance-sheet-row" ]
                |> Query.first
                |> Query.has [ text "owner one" ]
            )
        , it "displays the value associated with a row" <|
            (view balanceSheet
                |> Query.fromHtml
                |> Query.findAll [ class "balance-sheet-row" ]
                |> Query.first
                |> Query.has [ text "100.23" ]
            )
        , it "rounds the value to two decimal places" <|
            (view balanceSheet
                |> Query.fromHtml
                |> Query.findAll [ class "balance-sheet-row" ]
                |> Query.index 1
                |> Query.has [ text "185.00" ]
            )
        , it "has a header for the assets" <|
            (view balanceSheet
                |> Query.fromHtml
                |> Query.findAll [ class "assets-header" ]
                |> Query.count (Expect.equal 1)
            )
        , it "has a header for the liabilities" <|
            (view balanceSheet
                |> Query.fromHtml
                |> Query.findAll [ class "liabilities-header" ]
                |> Query.count (Expect.equal 1)
            )
        ]
