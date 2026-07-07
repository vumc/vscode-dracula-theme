-- Once upon a time...

local Vampire = {}
Vampire.__index = Vampire

function Vampire.new(location, birthDate, deathDate, weaknesses)
  local self = setmetatable({}, Vampire)
  self.location = location
  self.birthDate = birthDate
  self.deathDate = deathDate
  self.weaknesses = weaknesses
  return self
end

function Vampire:calcAge()
  return self.deathDate - self.birthDate
end

-- ...there was a guy named Vlad
local dracula = Vampire.new("Transylvania", 1428, 1476, { "Sunlight", "Garlic" })

print(dracula.location .. " is " .. dracula:calcAge() .. " years old")
