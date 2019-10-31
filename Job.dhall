let Container = (./Container.dhall).Type

let Env = ./Env.dhall

let RunsOn = ./RunsOn.dhall

let Step = (./Step.dhall).Type

let Strategy = (./Strategy.dhall).Type

in  { Type =
        { container : Optional Container
        , env : Env.Type
        , name : Text
        , needs : List Text
        , runs-on : Optional RunsOn
        , steps : List Step
        , strategy : Optional Strategy
        , timeout-minutes : Optional Natural
        , uses : Optional Text
        , working-directory : Optional Text
        }
    , default =
        { container = None Container
        , env = Env.empty
        , needs = [] : List Text
        , runs-on = None RunsOn
        , steps = [] : List Step
        , strategy = None Strategy
        , timeout-minutes = None Natural
        , uses = None Text
        , working-directory = None Text
        }
    }
