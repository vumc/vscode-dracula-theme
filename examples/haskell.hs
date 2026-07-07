-- | Once upon a time...
module Vampire where

data Vampire = Vampire
  { location   :: String
  , birthDate  :: Int
  , deathDate  :: Int
  , weaknesses :: [String]
  } deriving (Show)

calcAge :: Vampire -> Int
calcAge vampire = deathDate vampire - birthDate vampire

-- ...there was a guy named Vlad
dracula :: Vampire
dracula = Vampire
  { location = "Transylvania"
  , birthDate = 1428
  , deathDate = 1476
  , weaknesses = ["Sunlight", "Garlic"]
  }

main :: IO ()
main = print (calcAge dracula)
