module BalanceSheetView exposing (view)

import Html exposing (div, h1, Html, table, td, text, th, tr)
import Html.Attributes exposing (class)
import Model exposing (..)
import Date exposing (Date, day, month, year)
import FormatNumber


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ h1 [] [ text "Balance Sheet" ]
        , table [] (allRows model)
        ]


allRows : Model -> List (Html Msg)
allRows model =
    [ formattedHeaders ] ++ (List.map formattedBalanceSheetRow model.balanceSheet.rows)


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
        , td [] [ text (formattedValue row.value) ]
        ]


formattedDate : Date -> String
formattedDate date =
    (toString (year date))
        ++ "-"
        ++ (formattedMonth (month date))
        ++ "-"
        ++ (toString (day date))


formattedMonth : Date.Month -> String
formattedMonth month =
    case month of
        Date.Jan ->
            "01"

        Date.Feb ->
            "02"

        Date.Mar ->
            "03"

        Date.Apr ->
            "04"

        Date.May ->
            "05"

        Date.Jun ->
            "06"

        Date.Jul ->
            "07"

        Date.Aug ->
            "08"

        Date.Sep ->
            "09"

        Date.Oct ->
            "10"

        Date.Nov ->
            "11"

        Date.Dec ->
            "12"


formattedValue : Float -> String
formattedValue value =
    let
        locale =
            { decimals = 2
            , thousandSeparator = ","
            , decimalSeparator = "."
            , negativePrefix = "−"
            , negativeSuffix = ""
            }
    in
        FormatNumber.format locale value
