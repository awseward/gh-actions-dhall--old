let Event = ./Event.dhall

let Filters = ./Filters.dhall

let Job = ./Job.dhall

let PushEvent = ./PushEvent.dhall

let RunsOn = ./RunsOn.dhall

let ScheduleEvent = ./ScheduleEvent.dhall

let Step = ./Step.dhall

let Jobs = List { mapKey : Text, mapValue : Job.Type }

let Steps = List Step.Type

let cron = (./ScheduleEvent.dhall).cron

in  [ { name = "GitHub empty workflow"
      , on = Event.push PushEvent.simple
      , jobs = [] : Jobs
      }
    , { name = "Scheduled Workflow"
      , on = Event.schedule (cron "*/15 * * * *")
      , jobs = [] : Jobs
      }
    , { name = "Master Workflow"
      , on =
          Event.push
            ( PushEvent.filtered
                Filters::{
                , branches = [ "master" ]
                , paths-ignore = [ "README.md" ]
                }
            )
      , jobs =
          toMap
            { build-windows =
                Job::{
                , name = "Windows job"
                , runs-on = Some RunsOn.windows-latest
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
                , runs-on = Some RunsOn.ubuntu-latest
                }
            }
      }
    ]
