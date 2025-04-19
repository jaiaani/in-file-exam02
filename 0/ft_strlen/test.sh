#!/bin/bash

GREEN="\033[0;32m"
RED="\033[0;31m"
RESET="\033[0m"

EXPECTED_FILE="expected_output.txt"
ACTUAL_FILE="actual_output.txt"

cat << EOF > "$EXPECTED_FILE"
1: 8
2: 0
3: 21
4: 5
EOF

gcc -Wall -Wextra -Werror ft_strlen.c -o ft_strlen
if [ $? -ne 0 ]; then
  echo -e "${RED}❌ Compilation failed.${RESET}"
  exit 1
fi

./ft_strlen > "$ACTUAL_FILE"

if diff -u "$EXPECTED_FILE" "$ACTUAL_FILE" > diff.txt; then
  echo -e "${GREEN}✅ ft_strlen passed! Output is correct.${RESET}"
else
  echo -e "${RED}❌ Output mismatch!${RESET}"
  echo "Differences:"
  cat diff.txt
fi

rm -f "$EXPECTED_FILE" "$ACTUAL_FILE" diff.txt

