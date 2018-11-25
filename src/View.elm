module View exposing (view)

import BalanceSheetView
import Browser
import Html exposing (Html, a, div, h1, li, text, ul)
import Html.Attributes exposing (class, href)
import Model exposing (..)
import UpcomingExpensesView


view : Model -> Browser.Document Msg
view model =
    case model.route of
        HomeRoute ->
            { title = model.appName
            , body =
                [ navigationBar
                , homeView
                ]
            }

        BalanceSheetRoute ->
            { title = model.appName
            , body =
                [ navigationBar
                , BalanceSheetView.view model.balanceSheet
                ]
            }

        NotFoundRoute ->
            { title = model.appName
            , body =
                [ navigationBar
                , notFoundView
                ]
            }

        UpcomingExpensesRoute ->
            { title = model.appName
            , body =
                [ navigationBar
                , UpcomingExpensesView.view model.upcomingExpenses
                ]
            }


homeView : Html Msg
homeView =
    div [ class "container" ]
        [ h1 [] [ text "Home" ]
        ]


notFoundView : Html Msg
notFoundView =
    div []
        [ h1 [] [ text "Not Found" ]
        ]


navigationBar : Html Msg
navigationBar =
    div [ class "navbar" ]
        [ ul []
            [ li [] [ a [ href "home" ] [ text "Home" ] ]
            , li [] [ a [ href "balance_sheet" ] [ text "Balance Sheet" ] ]
            , li [] [ a [ href "upcoming_expenses" ] [ text "Upcoming Expenses" ] ]
            ]
        ]
