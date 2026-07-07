#include <stdio.h>

/*
 * Once upon a time...
 */
struct Vampire {
    char location[32];
    int birth_date;
    int death_date;
    char *weaknesses[2];
};

int calc_age(struct Vampire *vampire) {
    return vampire->death_date - vampire->birth_date;
}

/* ...there was a guy named Vlad */
int main(void) {
    struct Vampire dracula = {
        .location = "Transylvania",
        .birth_date = 1428,
        .death_date = 1476,
        .weaknesses = {"Sunlight", "Garlic"},
    };

    printf("%s is %d years old\n", dracula.location, calc_age(&dracula));

    return 0;
}
