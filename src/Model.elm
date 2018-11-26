module Model exposing (BalanceSheet, BalanceSheetRow, Flags, Model, Msg(..), Route(..), UpcomingExpenseRow, UpcomingExpenses, init)

import Browser
import Browser.Navigation as Nav
import Http
import Time
import Url


type alias Model =
    { appName : String
    , balanceSheet : BalanceSheet
    , upcomingExpenses : UpcomingExpenses
    , baseUrl : String
    , key : Nav.Key
    , url : Url.Url
    , route : Route
    }


type alias BalanceSheet =
    { assets : List BalanceSheetRow
    , liabilities : List BalanceSheetRow
    }


type alias UpcomingExpenses =
    { expenses : List UpcomingExpenseRow }


type alias BalanceSheetRow =
    { lastUpdated : Time.Posix
    , institution : String
    , account : String
    , investment : String
    , owner : String
    , value : Float
    }


type alias UpcomingExpenseRow =
    { itemNeedingReplacement : String
    , estimatedDateOfExpense : String
    , estimatedCost : Maybe Int
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
        (UpcomingExpenses upcomingExpenses)
        flags.baseUrl
        key
        url
        HomeRoute
    , Cmd.none
    )


upcomingExpenses : List UpcomingExpenseRow
upcomingExpenses =
    [ UpcomingExpenseRow "Main Refrigerator" "October 2019" (Just 2400)
    , UpcomingExpenseRow "Garage Renovation" "May 2019" (Just 5000)
    , UpcomingExpenseRow "Nine Piece Dining Room Set" "May 2019" (Just 1400)
    , UpcomingExpenseRow "Down Payment on Car Lease" "May 2019" (Just 2000)
    , UpcomingExpenseRow "Offset Box Smoker or Weber Smoky Mountain Vertical Smoker" "May 2019" (Just 500)
    , UpcomingExpenseRow "MacBook Pro" "December 2019" (Just 2500)
    , UpcomingExpenseRow "Furnace Replacement" "August 2020" (Just 7000)
    , UpcomingExpenseRow "Humidifier Replacement" "August 2020" (Just 825)
    , UpcomingExpenseRow "Mini-Fridge" "Unknown" (Just 200)
    , UpcomingExpenseRow "Renovation of Closet Under Stairs" "Unknown" Nothing
    , UpcomingExpenseRow "Sliding Shelves for Kitchen Cabinets" "Unknown" Nothing
    ]
