let none = [] : List Text

in  { Type = { paths : List Text, paths-ignore : List Text }
    , default = { paths = none, paths-ignore = none }
    }
