module BalanceSheetView exposing (view)

import Html exposing (div, h1, Html, table, td, text, th, tr)
import Html.Attributes exposing (class)
import Model exposing (..)


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ h1 [] [ text "Balance Sheet" ]
        , table []
            [ tr []
                [ th [ class "last-updated-header" ] [ text "Last Updated" ]
                , th [ class "institution-header" ] [ text "Institution" ]
                , th [ class "account-header" ] [ text "Account" ]
                , th [ class "investment-header" ] [ text "Investment" ]
                , th [ class "owner-header" ] [ text "Owner" ]
                , th [ class "value-header" ] [ text "Value" ]
                ]
            , tr []
                [ td
                    []
                    [ text "{{ row[0] }}" ]
                , td
                    []
                    [ text "{{ row[1] }}" ]
                , td
                    []
                    [ text "{{ row[2] }}" ]
                , td
                    []
                    [ text "{{ row[3] }}" ]
                , td
                    []
                    [ text "{{ row[4] }}" ]
                , td
                    []
                    [ text "{{ row[5] }}" ]
                ]
            ]
        ]
