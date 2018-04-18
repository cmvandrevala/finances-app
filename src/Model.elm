module Model exposing (..)

import Date exposing (Date)
import Http


type alias Model =
    { balanceSheet : BalanceSheet
    }


type alias BalanceSheet =
    { rows : List BalanceSheetRow }


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
    (Model (BalanceSheet []))


type Msg
    = GetBalanceSheetRowsFromApi
    | UpdateBalanceSheet (Result Http.Error BalanceSheet)
