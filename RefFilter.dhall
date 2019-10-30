let none = [] : List Text

in  { Type =
        { branches : List Text
        , branches-ignore : List Text
        , tags : List Text
        , tags-ignore : List Text
        }
    , default =
        { branches = none
        , branches-ignore = none
        , tags = none
        , tags-ignore = none
        }
    }
