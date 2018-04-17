module Model exposing (..)

import Date exposing (Date)
import Http


type alias Model =
    { balanceSheetRows : List BalanceSheetRow
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
    (Model [])


type Msg
    = GetBalanceSheetRowsFromApi
    | BalanceSheet (Result Http.Error Model)
