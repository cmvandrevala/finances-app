module Model exposing (..)

import Date exposing (Date)
import Http
import Navigation


type alias Model =
    { balanceSheet : BalanceSheet
    }


type alias BalanceSheet =
    { assets : List BalanceSheetRow
    , liabilities : List BalanceSheetRow
    }


type alias BalanceSheetRow =
    { lastUpdated : Date
    , institution : String
    , account : String
    , investment : String
    , owner : String
    , value : Float
    }


initialModel : Model
initialModel =
    (Model (BalanceSheet [] []))


type Msg
    = UrlChange Navigation.Location
    | GetBalanceSheetRowsFromApi
    | UpdateBalanceSheet (Result Http.Error BalanceSheet)
