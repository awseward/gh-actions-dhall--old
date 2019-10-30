let Event = ./Event.dhall

let RefFilter = ./RefFilter.dhall

let PathFilter = ./PathFilter.dhall

let Job = ./Job.dhall

let cron = (./ScheduleEvent.dhall).cron

in    [ { name = "Scheduled Workflow"
        , on = Event.schedule (cron "*/15 * * * *")
        , jobs = [] : List { mapKey : Text, mapValue : Job }
        }
      , { name = "Master-only Workflow"
        , on =
            Event.push
              ( let filters =
                        RefFilter::{ branches = [ "master" ] }
                      ⫽ PathFilter::{ paths-ignore = [ "README.md" ] }
                
                in  Some filters
              )
        , jobs =
            toMap
              { foo = { name = "My foo job", steps = [] : List ./Step.dhall }
              , bar = { name = "My bar job", steps = [] : List ./Step.dhall }
              }
        }
      ]
    : List ./Workflow.dhall
