"""
Once upon a time...
"""


class Vampire:
    def __init__(self, location, birth_date, death_date, weaknesses):
        self.location = location
        self.birth_date = birth_date
        self.death_date = death_date
        self.weaknesses = weaknesses

    @property
    def age(self):
        return self.calc_age()

    def calc_age(self):
        return self.death_date - self.birth_date


# ...there was a guy named Vlad
dracula = Vampire(
    location="Transylvania",
    birth_date=1428,
    death_date=1476,
    weaknesses=["Sunlight", "Garlic"],
)
