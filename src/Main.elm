module Main exposing (main)

import Html exposing (..)
import BalanceSheetView exposing (view)
import Model exposing (initialModel)
import Update exposing (update)
import Model exposing (..)


main : Program Never Model Msg
main =
    Html.program
        { init = ( initialModel, Cmd.none )
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }
