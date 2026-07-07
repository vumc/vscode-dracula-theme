#include <iostream>
#include <string>
#include <vector>

/**
 * Once upon a time...
 */
class Vampire {
public:
    Vampire(std::string location, int birthDate, int deathDate, std::vector<std::string> weaknesses)
        : location(location), birthDate(birthDate), deathDate(deathDate), weaknesses(weaknesses) {}

    int age() const {
        return calcAge();
    }

    int calcAge() const {
        return deathDate - birthDate;
    }

private:
    std::string location;
    int birthDate;
    int deathDate;
    std::vector<std::string> weaknesses;
};

// ...there was a guy named Vlad
int main() {
    Vampire dracula("Transylvania", 1428, 1476, {"Sunlight", "Garlic"});

    std::cout << dracula.age() << " years old" << std::endl;

    return 0;
}
