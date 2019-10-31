-- See: https://help.github.com/en/github/automating-your-workflow-with-github-actions/events-that-trigger-workflows#about-workflow-events

let Filters = (./RefFilter.dhall).Type ⩓ (./PathFilter.dhall).Type

let ScheduleEvent = (./ScheduleEvent.dhall).Type

in  < check_run
    | check_suite
    | create
    | delete
    | deployment
    | deployment_status
    | fork
    | gollum
    | issue_comment
    | issues
    | label
    | member
    | milestone
    | page_build
    | project
    | project_card
    | project_column
    | public
    | pull_request : Optional Filters
    | pull_request_review
    | pull_request_review_comment
    | push : (./PushEvent.dhall).Type
    | release
    | status
    | watch
    | schedule : ScheduleEvent
    | repository_dispatch
    >
