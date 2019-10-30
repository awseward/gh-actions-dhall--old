let Event = ./Event.dhall

let RefFilter = ./RefFilter.dhall

let cron = (./ScheduleEvent.dhall).cron

in    [ { name = "Scheduled Workflow"
        , on = Event.schedule (cron "*/15 * * * *")
        }
      , { name = "Master-only Workflow"
        , on = Event.push (Some RefFilter::{ branches = [ "master" ] })
        }
      ]
    : List ./Workflow.dhall
