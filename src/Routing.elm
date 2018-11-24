module Routing exposing (balanceSheetUrl, fromUrl, homeUrl, upcomingExpensesUrl)

import Browser.Navigation as Nav
import Model exposing (Route(..))
import Url
import Url.Parser exposing (Parser, map, oneOf, parse, s)


fromUrl : Url.Url -> Route
fromUrl url =
    Maybe.withDefault NotFoundRoute (parse routeParser url)


routeParser : Parser (Route -> a) a
routeParser =
    oneOf
        [ map HomeRoute (s "home")
        , map BalanceSheetRoute (s "balance_sheet")
        , map UpcomingExpensesRoute (s "upcoming_expenses")
        ]


balanceSheetUrl : Url.Url
balanceSheetUrl =
    { protocol = Url.Http
    , host = "localhost"
    , port_ = Nothing
    , path = "balance_sheet"
    , query = Nothing
    , fragment = Nothing
    }


homeUrl : Url.Url
homeUrl =
    { protocol = Url.Http
    , host = "localhost"
    , port_ = Nothing
    , path = "home"
    , query = Nothing
    , fragment = Nothing
    }


upcomingExpensesUrl : Url.Url
upcomingExpensesUrl =
    { protocol = Url.Http
    , host = "localhost"
    , port_ = Nothing
    , path = "upcoming_expenses"
    , query = Nothing
    , fragment = Nothing
    }
