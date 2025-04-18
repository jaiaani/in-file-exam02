#!/bin/bash

GREEN="\033[0;32m"
RED="\033[0;31m"
RESET="\033[0m"

ACTUAL_FILE="actual_output.txt"

gcc -Wall -Wextra -Werror first_word.c -o first_word
if [ $? -ne 0 ]; then
  echo -e "${RED}❌ Compilation failed.${RESET}"
  exit 1
fi

tests=(
  '""' '$'
  '"FOR PONY"' 'FOR$'
  '"this        ...       is sparta, then again, maybe    not"' 'this$'
  '"   "' '$'
  '"a" "b"' '$'
  '"  lorem,ipsum  "' 'lorem,ipsum$'
)

total=${#tests[@]}
pass=0

echo "Running tests..."

for ((i=0; i<total; i+=2)); do
  input=${tests[i]}
  expected=${tests[i+1]}

  # Executar programa
  eval ./first_word $input | cat -e > "$ACTUAL_FILE"
  actual=$(cat "$ACTUAL_FILE")

  if [ "$actual" = "$expected" ]; then
    echo -e "${GREEN}✅ Test passed:${RESET} ./first_word $input"
    ((pass++))
  else
    echo -e "${RED}❌ Test failed:${RESET} ./first_word $input"
    echo "Expected: $expected"
    echo "Got     : $actual"
  fi
done

echo
echo -e "Result: ${GREEN}$pass${RESET}/$((total/2)) tests passed"

rm -f "$ACTUAL_FILE"

