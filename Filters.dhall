let RefFilter = ./RefFilter.dhall

let PathFilter = ./PathFilter.dhall

in  { Type = RefFilter.Type ⩓ PathFilter.Type
    , default = RefFilter.default ⫽ PathFilter.default
    }
