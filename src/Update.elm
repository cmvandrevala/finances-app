module Update exposing (update)

import BalanceSheetDecoder exposing (balanceSheetDecoder)
import Http
import Model exposing (..)
import Routing exposing (parseLocation)


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlChange location ->
            ( { model | route = (parseLocation location) }, Cmd.none )

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
