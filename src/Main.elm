module Main exposing (main)

import BalanceSheetView exposing (view)
import Update exposing (update)
import Model exposing (..)
import Navigation


main : Program Flags Model Msg
main =
    Navigation.programWithFlags UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }


init : Flags -> Navigation.Location -> ( Model, Cmd Msg )
init flags _ =
    let
        initialModel =
            (Model (BalanceSheet [] []) flags.baseUrl)
    in
        ( initialModel, Cmd.none )
