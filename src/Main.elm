module Main exposing (main)

import Browser
import Browser.Navigation as Nav
import Model exposing (..)
import Update exposing (update)
import Url
import View exposing (view)


main : Program Flags Model Msg
main =
    Browser.application
        { init = Model.init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        , onUrlChange = UrlChanged
        , onUrlRequest = LinkClicked
        }
