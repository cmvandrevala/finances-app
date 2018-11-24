module Model exposing (BalanceSheet, BalanceSheetRow, Flags, Model, Msg(..), Route(..), init)

import Browser
import Browser.Navigation as Nav
import Http
import Time
import Url


type alias Model =
    { appName : String
    , balanceSheet : BalanceSheet
    , baseUrl : String
    , key : Nav.Key
    , url : Url.Url
    , route : Route
    }


type alias BalanceSheet =
    { assets : List BalanceSheetRow
    , liabilities : List BalanceSheetRow
    }


type alias BalanceSheetRow =
    { lastUpdated : Time.Posix
    , institution : String
    , account : String
    , investment : String
    , owner : String
    , value : Float
    }


type alias Flags =
    { baseUrl : String }


type Msg
    = GetBalanceSheetRowsFromApi
    | LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url
    | UpdateBalanceSheet (Result Http.Error BalanceSheet)


type Route
    = HomeRoute
    | BalanceSheetRoute
    | NotFoundRoute
    | UpcomingExpensesRoute


init : Flags -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    ( Model
        "Maneki Neko"
        (BalanceSheet [] [])
        flags.baseUrl
        key
        url
        HomeRoute
    , Cmd.none
    )
