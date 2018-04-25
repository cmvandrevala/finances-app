module Routing exposing (parseLocation)

import Navigation exposing (..)
import UrlParser exposing (..)
import Model exposing (..)


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map HomeRoute (s "home")
        , map BalanceSheetRoute (s "balance_sheet")
        ]


parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of
        Just route ->
            route

        Nothing ->
            NotFoundRoute
