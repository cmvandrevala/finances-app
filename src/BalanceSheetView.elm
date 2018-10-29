module BalanceSheetView exposing (view)

import Date exposing (Date, day, month, year)
import DateFormatter exposing (formatMonth)
import FormatNumber
import Html exposing (Html, button, div, h1, h2, table, td, text, th, tr)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Model exposing (..)


view : Model -> Html Msg
view model =
    div [ class "container" ]
        [ h1 [] [ text "Balance Sheet" ]
        , button [ class "get-balance-sheet", onClick GetBalanceSheetRowsFromApi ] [ text "Refresh the Balance Sheet" ]
        , h2 [ class "assets-header" ] [ text "Assets" ]
        , table [] (allRows model.balanceSheet.assets)
        , h2 [ class "liabilities-header" ] [ text "Liabilities" ]
        , table [] (allRows model.balanceSheet.liabilities)
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
        , td [] [ text (formattedValue row.value) ]
        ]


formattedDate : Date -> String
formattedDate date =
    toString (year date)
        ++ "-"
        ++ formatMonth (month date)
        ++ "-"
        ++ toString (day date)


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
