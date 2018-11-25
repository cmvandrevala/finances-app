module UpcomingExpensesView exposing (view)

import Html exposing (Html, div, h1, table, td, text, th, tr)
import Html.Attributes exposing (class)
import Model exposing (Model, Msg)


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ h1 [] [ text "Upcoming Expenses" ]
        , table [] (tableRows upcomingExpenses)
        ]


tableRows : List UpcomingExpenseRow -> List (Html Msg)
tableRows upcomingExpenseRows =
    [ tr []
        [ th [] [ text "Item Needing Replacement" ]
        , th [] [ text "Estimated Date of Expense" ]
        , th [] [ text "Estimated Cost" ]
        ]
    ]
        ++ List.map formattedUpcomingExpenseRow upcomingExpenses


formattedUpcomingExpenseRow : UpcomingExpenseRow -> Html Msg
formattedUpcomingExpenseRow upcomingExpenseRow =
    tr []
        [ td [] [ text upcomingExpenseRow.itemNeedingReplacement ]
        , td [] [ text upcomingExpenseRow.estimatedDateOfExpense ]
        , td [] [ text upcomingExpenseRow.estimatedCost ]
        ]


upcomingExpenses : List UpcomingExpenseRow
upcomingExpenses =
    [ UpcomingExpenseRow "Refrigerator" "October 2019" "$2400"
    , UpcomingExpenseRow "Garage Renovation" "May 2019" "$5000"
    , UpcomingExpenseRow "Nine Piece Dining Room Set" "May 2019" "$1400"
    , UpcomingExpenseRow "Down Payment on Car Lease" "May 2019" "$2000"
    , UpcomingExpenseRow "Offset Box Smoker or Weber Smoky Mountain Vertical Smoker" "May 2019" "$500"
    , UpcomingExpenseRow "MacBook Pro" "December 2019" "$2500"
    , UpcomingExpenseRow "Furnace Replacement" "August 2020" "$7000"
    , UpcomingExpenseRow "Humidifier Replacement" "August 2020" "$825"
    , UpcomingExpenseRow "Cell Phone Bill" "Unknown" "$140/month"
    ]


type alias UpcomingExpenseRow =
    { itemNeedingReplacement : String
    , estimatedDateOfExpense : String
    , estimatedCost : String
    }
