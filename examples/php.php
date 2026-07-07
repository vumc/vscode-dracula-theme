<?php

/**
 * Once upon a time...
 */
class Vampire
{
    public string $location;
    public int $birthDate;
    public int $deathDate;
    public array $weaknesses;

    public function __construct(string $location, int $birthDate, int $deathDate, array $weaknesses)
    {
        $this->location = $location;
        $this->birthDate = $birthDate;
        $this->deathDate = $deathDate;
        $this->weaknesses = $weaknesses;
    }

    public function age(): int
    {
        return $this->calcAge();
    }

    public function calcAge(): int
    {
        return $this->deathDate - $this->birthDate;
    }
}

// ...there was a guy named Vlad
$dracula = new Vampire(
    location: "Transylvania",
    birthDate: 1428,
    deathDate: 1476,
    weaknesses: ["Sunlight", "Garlic"],
);
