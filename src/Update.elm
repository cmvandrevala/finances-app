module Update exposing (update)

import BalanceSheetDecoder exposing (balanceSheetDecoder)
import Browser
import Browser.Navigation as Nav
import Http
import Model exposing (Model, Msg(..))
import Routing exposing (fromUrl)
import Url


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlChanged url ->
            ( { model | url = url, route = fromUrl url }, Cmd.none )

        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

        GetBalanceSheetRowsFromApi ->
            ( model, getBalanceSheetRowsFromApi model )

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
