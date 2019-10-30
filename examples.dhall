let Env = ./Env.dhall

let Event = ./Event.dhall

let Job = ./Job.dhall

let PathFilter = ./PathFilter.dhall

let RefFilter = ./RefFilter.dhall

let RunsOn = ./RunsOn.dhall

let Step = ./Step.dhall

let Jobs = List { mapKey : Text, mapValue : Job.Type }

let Steps = List Step.Type

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
                , runs-on = Some RunsOn.ubuntu-latest
                }
            , build-ubuntu =
                Job::{
                , env = toMap { HELLo = "WORLD", FOO = "BAR" }
                , name = "Ubuntu job"
                , steps =
                    [ Step::{
                      , env = toMap { HOME = "/var/www" }
                      , name = Some "Some step"
                      }
                    ]
                , runs-on = Some RunsOn.windows-latest
                }
            }
      }
    ]
