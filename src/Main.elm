module Main exposing (main)

import Model exposing (..)
import Navigation
import Update exposing (update)
import View exposing (view)


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
            Model (BalanceSheet [] []) flags.baseUrl HomeRoute
    in
    ( initialModel, Cmd.none )
