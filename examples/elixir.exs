# Once upon a time...
defmodule Vampire do
  defstruct [:location, :birth_date, :death_date, :weaknesses]

  def calc_age(%Vampire{birth_date: birth_date, death_date: death_date}) do
    death_date - birth_date
  end
end

# ...there was a guy named Vlad
dracula = %Vampire{
  location: "Transylvania",
  birth_date: 1428,
  death_date: 1476,
  weaknesses: ["Sunlight", "Garlic"]
}

IO.puts("#{dracula.location} is #{Vampire.calc_age(dracula)} years old")
