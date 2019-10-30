let Shell = ./Shell.dhall

let Env = ./Env.dhall

in  { Type = { env : Env.Type, name : Optional Text, shell : Optional Shell }
    , default = { env = Env.empty, name = None Text, shell = None Shell }
    }
