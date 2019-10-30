let Container = (./Container.dhall).Type

let RunsOn = ./RunsOn.dhall

let Strategy = (./Strategy.dhall).Type

in  { Type =
        { container : Optional Container
        , env : Optional {}
        , name : Text
        , needs : List Text
        , runs-on : Optional RunsOn
        , steps : List (./Step.dhall).Type
        , strategy : Optional Strategy
        , timeout-minutes : Optional Natural
        , uses : Optional Text
        , working-directory : Optional Text
        }
    , default =
        { container = None Container
        , env = None {}
        , needs = [] : List Text
        , runs-on = None RunsOn
        , strategy = None Strategy
        , timeout-minutes = None Natural
        , uses = None Text
        , working-directory = None Text
        }
    }
