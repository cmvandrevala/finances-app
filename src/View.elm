module View exposing (view)

import BalanceSheetView
import Html exposing (Html, div, h1, text)
import Html.Attributes exposing (class)
import Model exposing (..)
import UpcomingExpensesView


view : Model -> Html Msg
view model =
    case model.route of
        HomeRoute ->
            div [ class "container" ]
                [ h1 [] [ text "Home" ]
                ]

        BalanceSheetRoute ->
            BalanceSheetView.view model

        NotFoundRoute ->
            div []
                [ h1 [] [ text "Not Found" ]
                ]

        UpcomingExpensesRoute ->
            UpcomingExpensesView.view model
