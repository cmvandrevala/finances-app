module Routing exposing (parseLocation)

import Model exposing (..)
import Navigation exposing (..)
import UrlParser exposing (..)


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map HomeRoute (s "home")
        , map BalanceSheetRoute (s "balance_sheet")
        , map UpcomingExpensesRoute (s "upcoming_expenses")
        ]


parseLocation : Location -> Route
parseLocation location =
    case parseHash matchers location of
        Just route ->
            route

        Nothing ->
            NotFoundRoute
