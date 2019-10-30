{ name : Text
, on : ./Event.dhall
, jobs : List { mapKey : Text, mapValue : (./Job.dhall).Type }
}
