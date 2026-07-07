#!/usr/bin/env bash

# Once upon a time...

VAMPIRE_LOCATION="Transylvania"
VAMPIRE_BIRTH_DATE=1428
VAMPIRE_DEATH_DATE=1476
VAMPIRE_WEAKNESSES=("Sunlight" "Garlic")

calc_age() {
  echo $(( VAMPIRE_DEATH_DATE - VAMPIRE_BIRTH_DATE ))
}

# ...there was a guy named Vlad
main() {
  local age
  age=$(calc_age)

  echo "${VAMPIRE_LOCATION} is ${age} years old"
  echo "Weaknesses: ${VAMPIRE_WEAKNESSES[*]}"
}

main
