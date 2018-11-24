module BalanceSheetDecoder exposing (balanceSheetDecoder)

import Json.Decode as JD
import Model exposing (BalanceSheet, BalanceSheetRow)
import Time


balanceSheetDecoder : JD.Decoder BalanceSheet
balanceSheetDecoder =
    JD.map2 BalanceSheet
        (JD.field "assets" (JD.list balanceSheetRowDecoder))
        (JD.field "liabilities" (JD.list balanceSheetRowDecoder))


balanceSheetRowDecoder : JD.Decoder BalanceSheetRow
balanceSheetRowDecoder =
    JD.map6 BalanceSheetRow
        (JD.field "lastUpdated" posixDecoder)
        (JD.field "institution" JD.string)
        (JD.field "account" JD.string)
        (JD.field "investment" JD.string)
        (JD.field "owner" JD.string)
        (JD.field "value" JD.float)


posixDecoder : JD.Decoder Time.Posix
posixDecoder =
    JD.int |> JD.andThen toPosix


toPosix : Int -> JD.Decoder Time.Posix
toPosix epochInMilliseconds =
    JD.succeed (Time.millisToPosix epochInMilliseconds)
