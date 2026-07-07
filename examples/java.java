import java.util.List;

/**
 * Once upon a time...
 */
class Vampire {
    private final String location;
    private final int birthDate;
    private final int deathDate;
    private final List<String> weaknesses;

    public Vampire(String location, int birthDate, int deathDate, List<String> weaknesses) {
        this.location = location;
        this.birthDate = birthDate;
        this.deathDate = deathDate;
        this.weaknesses = weaknesses;
    }

    public int getAge() {
        return calcAge();
    }

    public int calcAge() {
        return deathDate - birthDate;
    }
}

// ...there was a guy named Vlad
class Main {
    public static void main(String[] args) {
        Vampire dracula = new Vampire("Transylvania", 1428, 1476, List.of("Sunlight", "Garlic"));

        System.out.println(dracula.getAge() + " years old");
    }
}
