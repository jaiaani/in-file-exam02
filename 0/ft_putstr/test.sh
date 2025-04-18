#!/bin/bash

GREEN="\033[0;32m"
RED="\033[0;31m"
RESET="\033[0m"

EXPECTED_FILE="expected_output.txt"
ACTUAL_FILE="actual_output.txt"

cat << EOF > "$EXPECTED_FILE"
Hello, World!
777

Nice, it seems to be working :)
EOF

gcc -Wall -Wextra -Werror ft_putstr.c -o ft_putstr
if [ $? -ne 0 ]; then
  echo -e "${RED}❌ Compilation failed.${RESET}"
  exit 1
fi

./ft_putstr > "$ACTUAL_FILE"

if diff -u "$EXPECTED_FILE" "$ACTUAL_FILE" > diff.txt; then
  echo -e "${GREEN}✅ ft_putstr passed! Output is correct.${RESET}"
else
  echo -e "${RED}❌ Output mismatch!${RESET}"
  echo "Differences:"
  cat diff.txt
fi

rm -f "$EXPECTED_FILE" "$ACTUAL_FILE" diff.txt

