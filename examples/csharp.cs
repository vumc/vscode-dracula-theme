using System;
using System.Collections.Generic;

/// <summary>
/// Once upon a time...
/// </summary>
class Vampire
{
    public string Location { get; set; }
    public int BirthDate { get; set; }
    public int DeathDate { get; set; }
    public List<string> Weaknesses { get; set; }

    public Vampire(string location, int birthDate, int deathDate, List<string> weaknesses)
    {
        Location = location;
        BirthDate = birthDate;
        DeathDate = deathDate;
        Weaknesses = weaknesses;
    }

    public int Age => CalcAge();

    public int CalcAge()
    {
        return DeathDate - BirthDate;
    }
}

// ...there was a guy named Vlad
class Program
{
    static void Main()
    {
        var dracula = new Vampire("Transylvania", 1428, 1476, new List<string> { "Sunlight", "Garlic" });

        Console.WriteLine($"{dracula.Location} is {dracula.Age} years old");
    }
}
