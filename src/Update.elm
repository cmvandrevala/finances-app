module Update exposing (update)

import Model exposing (..)
import Http
import BalanceSheetDecoder exposing (balanceSheetDecoder)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlChange location ->
            ( model, Cmd.none )

        GetBalanceSheetRowsFromApi ->
            ( model, (getBalanceSheetRowsFromApi model) )

        UpdateBalanceSheet (Ok balanceSheet) ->
            ( { model | balanceSheet = balanceSheet }, Cmd.none )

        UpdateBalanceSheet (Err _) ->
            ( model, Cmd.none )


getBalanceSheetRowsFromApi : Model -> Cmd Msg
getBalanceSheetRowsFromApi model =
    let
        request =
            Http.get (model.baseUrl ++ "/balance_sheet_rows") balanceSheetDecoder
    in
        Http.send UpdateBalanceSheet request
