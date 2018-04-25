module View exposing (view)

import Model exposing (..)
import Html exposing (div, h1, Html, text)
import BalanceSheetView


view : Model -> Html Msg
view model =
    case model.route of
        HomeRoute ->
            div []
                [ h1 [] [ text "Home" ]
                ]

        BalanceSheetRoute ->
            BalanceSheetView.view model

        NotFoundRoute ->
            div []
                [ h1 [] [ text "Not Found" ]
                ]
