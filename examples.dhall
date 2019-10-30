let Event = ./Event.dhall

let Job = ./Job.dhall

let PathFilter = ./PathFilter.dhall

let RefFilter = ./RefFilter.dhall

let RunsOn = ./RunsOn.dhall

let Jobs = List { mapKey : Text, mapValue : Job.Type }

let Steps = List (./Step.dhall).Type

let cron = (./ScheduleEvent.dhall).cron

in  [ { name = "Scheduled Workflow"
      , on = Event.schedule (cron "*/15 * * * *")
      , jobs = [] : Jobs
      }
    , { name = "Master Workflow"
      , on =
          Event.push
            ( let filters =
                      RefFilter::{ branches = [ "master" ] }
                    ⫽ PathFilter::{ paths-ignore = [ "README.md" ] }
              
              in  Some filters
            )
      , jobs =
          toMap
            { build-windows =
                Job::{
                , name = "Windows job"
                , steps = [] : Steps
                , runs-on = Some RunsOn.ubuntu-latest
                }
            , build-ubuntu =
                Job::{
                , name = "Ubuntu job"
                , steps = [] : Steps
                , runs-on = Some RunsOn.windows-latest
                }
            }
      }
    ]
