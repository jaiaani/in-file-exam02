#!/bin/bash

GREEN="\033[0;32m"
RED="\033[0;31m"
RESET="\033[0m"

EXPECTED_FILE="expected_output.txt"
ACTUAL_FILE="actual_output.txt"

# Gerar saída esperada
{
  for i in $(seq 1 100); do
    if (( i % 15 == 0 )); then
      echo "fizzbuzz"
    elif (( i % 3 == 0 )); then
      echo "fizz"
    elif (( i % 5 == 0 )); then
      echo "buzz"
    else
      echo "$i"
    fi
  done
} > "$EXPECTED_FILE"

# Compilar
gcc -Wall -Wextra -Werror fizzbuzz.c -o fizzbuzz
if [ $? -ne 0 ]; then
  echo -e "${RED}❌ Compilation failed.${RESET}"
  exit 1
fi

# Executar
./fizzbuzz > "$ACTUAL_FILE"

# Comparar
if diff -u "$EXPECTED_FILE" "$ACTUAL_FILE" > diff.txt; then
  echo -e "${GREEN}✅ fizzbuzz passed! Output is correct.${RESET}"
else
  echo -e "${RED}❌ Output mismatch!${RESET}"
  echo "Differences:"
  cat diff.txt
fi

# Limpeza (remova se quiser manter arquivos)
rm -f "$EXPECTED_FILE" "$ACTUAL_FILE" diff.txt

