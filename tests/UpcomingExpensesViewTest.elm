module UpcomingExpensesViewTest exposing (suite)

import ElmTestBDDStyle exposing (expect, it, to)
import Expect
import Html.Attributes as Attr
import Model exposing (UpcomingExpenseRow, UpcomingExpenses)
import Test exposing (Test, describe)
import Test.Html.Query as Query
import Test.Html.Selector exposing (attribute, class, tag, text)
import UpcomingExpensesView exposing (view)


suite : Test
suite =
    describe "the balance sheet view"
        [ it "has a title of Upcoming Expenses" <|
            (view (UpcomingExpenses [])
                |> Query.fromHtml
                |> Query.find [ tag "h1" ]
                |> Query.has [ text "Upcoming Expenses" ]
            )
        , it "displays a list with one upcoming expense" <|
            (view (UpcomingExpenses [ UpcomingExpenseRow "Item" "Date" "$500" ])
                |> Query.fromHtml
                |> Query.findAll [ attribute <| Attr.attribute "data-id" "expense" ]
                |> Query.count (Expect.equal 1)
            )
        , it "displays a list with two upcoming expenses" <|
            (view (UpcomingExpenses [ UpcomingExpenseRow "Item" "Date" "$500", UpcomingExpenseRow "Item" "Date" "$500" ])
                |> Query.fromHtml
                |> Query.findAll [ attribute <| Attr.attribute "data-id" "expense" ]
                |> Query.count (Expect.equal 2)
            )
        , it "displays the item name" <|
            (view (UpcomingExpenses [ UpcomingExpenseRow "Item" "Date" "$500" ])
                |> Query.fromHtml
                |> Query.find [ attribute <| Attr.attribute "data-id" "name" ]
                |> Query.has [ text "Item" ]
            )
        , it "displays the estimated date of replacement" <|
            (view (UpcomingExpenses [ UpcomingExpenseRow "Item" "Date" "$500" ])
                |> Query.fromHtml
                |> Query.find [ attribute <| Attr.attribute "data-id" "date-of-replacement" ]
                |> Query.has [ text "Date" ]
            )
        , it "displays the cost" <|
            (view (UpcomingExpenses [ UpcomingExpenseRow "Item" "Date" "$500" ])
                |> Query.fromHtml
                |> Query.find [ attribute <| Attr.attribute "data-id" "cost" ]
                |> Query.has [ text "$500" ]
            )
        ]
