# Once upon a time...

class Vampire
  attr_reader :location, :birth_date, :death_date, :weaknesses

  def initialize(location:, birth_date:, death_date:, weaknesses:)
    @location = location
    @birth_date = birth_date
    @death_date = death_date
    @weaknesses = weaknesses
  end

  def age
    calc_age
  end

  def calc_age
    death_date - birth_date
  end
end

# ...there was a guy named Vlad
dracula = Vampire.new(
  location: "Transylvania",
  birth_date: 1428,
  death_date: 1476,
  weaknesses: ["Sunlight", "Garlic"],
)
