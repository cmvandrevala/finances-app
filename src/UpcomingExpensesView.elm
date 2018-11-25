module UpcomingExpensesView exposing (view)

import Html exposing (Html, div, h1, table, td, text, th, tr)
import Html.Attributes as Attr exposing (class)
import Model exposing (Model, Msg, UpcomingExpenseRow, UpcomingExpenses)


view : UpcomingExpenses -> Html Msg
view upcomingExpenses =
    div [ class "container" ]
        [ h1 [] [ text "Upcoming Expenses" ]
        , table [] (tableRows upcomingExpenses)
        ]


tableRows : UpcomingExpenses -> List (Html Msg)
tableRows upcomingExpenses =
    [ tr []
        [ th [] [ text "Item Needing Replacement" ]
        , th [] [ text "Estimated Date of Expense" ]
        , th [] [ text "Estimated Cost" ]
        ]
    ]
        ++ List.map formattedUpcomingExpenseRow upcomingExpenses.expenses


formattedUpcomingExpenseRow : UpcomingExpenseRow -> Html Msg
formattedUpcomingExpenseRow upcomingExpenseRow =
    tr [ Attr.attribute "data-id" "expense" ]
        [ td [ Attr.attribute "data-id" "name" ] [ text upcomingExpenseRow.itemNeedingReplacement ]
        , td [ Attr.attribute "data-id" "date-of-replacement" ] [ text upcomingExpenseRow.estimatedDateOfExpense ]
        , td [ Attr.attribute "data-id" "cost" ] [ text upcomingExpenseRow.estimatedCost ]
        ]
