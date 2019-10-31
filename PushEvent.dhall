let Filters = (./Filters.dhall).Type

let type = < push | filtered : { push : Filters } >

in  { Type = type
    , simple = type.push
    , filtered = λ(filters : Filters) → type.filtered { push = filters }
    }
