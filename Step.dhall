let Shell = ./Shell.dhall

in  { Type = { name : Optional Text, shell : Optional Shell }
    , default = { name = None Text, shell = None Shell }
    }
