module MainTest exposing (..)

import ElmTestBDDStyle exposing (..)
import Main exposing (..)
import Test exposing (..)
import Test.Html.Query as Query
import Test.Html.Selector exposing (text, tag)
import ElmTestBDDStyle exposing (..)


suite : Test
suite =
    describe "Maneki Neko"
        [ it "has a title of Maneki Neko" <|
            ((view initialModel)
                |> Query.fromHtml
                |> Query.find [ tag "h1" ]
                |> Query.has [ text "Maneki Neko" ]
            )
        ]
