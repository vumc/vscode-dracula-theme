/// Once upon a time...
struct Vampire {
    location: String,
    birth_date: i32,
    death_date: i32,
    weaknesses: Vec<String>,
}

impl Vampire {
    fn new(location: &str, birth_date: i32, death_date: i32, weaknesses: Vec<String>) -> Self {
        Vampire {
            location: location.to_string(),
            birth_date,
            death_date,
            weaknesses,
        }
    }

    fn age(&self) -> i32 {
        self.calc_age()
    }

    fn calc_age(&self) -> i32 {
        self.death_date - self.birth_date
    }
}

// ...there was a guy named Vlad
fn main() {
    let dracula = Vampire::new(
        "Transylvania",
        1428,
        1476,
        vec!["Sunlight".to_string(), "Garlic".to_string()],
    );

    println!("{} is {} years old", dracula.location, dracula.age());
}
