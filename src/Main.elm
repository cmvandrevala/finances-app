module Main exposing (main)

import BalanceSheetView exposing (view)
import Model exposing (initialModel)
import Update exposing (update)
import Model exposing (..)
import Navigation


main : Program Never Model Msg
main =
    Navigation.program UrlChange
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }


init : Navigation.Location -> ( Model, Cmd Msg )
init location =
    ( initialModel, Cmd.none )
