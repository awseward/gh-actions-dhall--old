let ScheduleEvent = { schedule : List { cron : Text } }

let cron =
        λ(cronExpr : Text)
      → { schedule = [ { cron = cronExpr } ] } : ScheduleEvent

in  { Type = ScheduleEvent, cron = cron }
