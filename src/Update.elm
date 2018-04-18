module Update exposing (update)

import Model exposing (..)
import Http
import BalanceSheetDecoder exposing (balanceSheetDecoder)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GetBalanceSheetRowsFromApi ->
            ( model, getBalanceSheetRowsFromApi )

        UpdateBalanceSheet (Ok balanceSheet) ->
            ( { model | balanceSheet = balanceSheet }, Cmd.none )

        UpdateBalanceSheet (Err _) ->
            ( model, Cmd.none )


getBalanceSheetRowsFromApi : Cmd Msg
getBalanceSheetRowsFromApi =
    let
        request =
            Http.get "http://localhost:4000/balance_sheet_rows" balanceSheetDecoder
    in
        Http.send UpdateBalanceSheet request
