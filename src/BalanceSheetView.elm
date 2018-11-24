module BalanceSheetView exposing (view)

import Html exposing (Html, button, div, h1, h2, table, td, text, th, tr)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Model exposing (..)
import Round
import Time


view : BalanceSheet -> Html Msg
view balanceSheet =
    div [ class "container" ]
        [ h1 [] [ text "Balance Sheet" ]
        , button [ class "get-balance-sheet", onClick GetBalanceSheetRowsFromApi ] [ text "Refresh the Balance Sheet" ]
        , h2 [ class "assets-header" ] [ text "Assets" ]
        , table [] (allRows balanceSheet.assets)
        , h2 [ class "liabilities-header" ] [ text "Liabilities" ]
        , table [] (allRows balanceSheet.liabilities)
        ]


allRows : List BalanceSheetRow -> List (Html Msg)
allRows rows =
    [ formattedHeaders ] ++ List.map formattedBalanceSheetRow rows


formattedHeaders : Html Msg
formattedHeaders =
    tr []
        [ th [ class "last-updated-header" ] [ text "Last Updated" ]
        , th [ class "institution-header" ] [ text "Institution" ]
        , th [ class "account-header" ] [ text "Account" ]
        , th [ class "investment-header" ] [ text "Investment" ]
        , th [ class "owner-header" ] [ text "Owner" ]
        , th [ class "value-header" ] [ text "Value" ]
        ]


formattedBalanceSheetRow : BalanceSheetRow -> Html Msg
formattedBalanceSheetRow row =
    tr [ class "balance-sheet-row" ]
        [ td [] [ text (formattedDate row.lastUpdated) ]
        , td [] [ text row.institution ]
        , td [] [ text row.account ]
        , td [] [ text row.investment ]
        , td [] [ text row.owner ]
        , td [] [ text (Round.round 2 row.value) ]
        ]


formattedDate : Time.Posix -> String
formattedDate posixTime =
    String.fromInt (Time.toYear Time.utc posixTime)
        ++ "-"
        ++ formattedMonth (Time.toMonth Time.utc posixTime)
        ++ "-"
        ++ String.fromInt (Time.toDay Time.utc posixTime)


formattedMonth : Time.Month -> String
formattedMonth month =
    case month of
        Time.Jan ->
            "01"

        Time.Feb ->
            "02"

        Time.Mar ->
            "03"

        Time.Apr ->
            "04"

        Time.May ->
            "05"

        Time.Jun ->
            "06"

        Time.Jul ->
            "07"

        Time.Aug ->
            "08"

        Time.Sep ->
            "09"

        Time.Oct ->
            "10"

        Time.Nov ->
            "11"

        Time.Dec ->
            "12"
