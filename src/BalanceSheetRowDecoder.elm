module BalanceSheetRowDecoder exposing (balanceSheetRowDecoder)

import Json.Decode exposing (..)
import Model exposing (..)
import Date exposing (Date)


balanceSheetRowDecoder : Decoder BalanceSheetRow
balanceSheetRowDecoder =
    map6 BalanceSheetRow
        (field "lastUpdated" dateDecoder)
        (field "institution" string)
        (field "account" string)
        (field "investment" string)
        (field "owner" string)
        (field "value" float)


dateDecoder : Decoder Date
dateDecoder =
    let
        convert : String -> Decoder Date
        convert raw =
            case Date.fromString raw of
                Ok date ->
                    succeed date

                Err error ->
                    fail error
    in
        string |> andThen convert
