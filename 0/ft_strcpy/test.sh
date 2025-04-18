#!/bin/bash

GREEN="\033[0;32m"
RED="\033[0;31m"
RESET="\033[0m"

EXPECTED_FILE="expected_output.txt"
ACTUAL_FILE="actual_output.txt"

cat << EOF > "$EXPECTED_FILE"
1: Hello
2: I should be the same on the other side...
3: 
EOF

gcc -Wall -Wextra -Werror ft_strcpy.c -o ft_strcpy
if [ $? -ne 0 ]; then
  echo -e "${RED}❌ Compilation failed.${RESET}"
  exit 1
fi

# Executar e capturar saída
./ft_strcpy > "$ACTUAL_FILE"

# Comparar
if diff -u "$EXPECTED_FILE" "$ACTUAL_FILE" > diff.txt; then
  echo -e "${GREEN}✅ ft_strcpy passed! Output is correct.${RESET}"
else
  echo -e "${RED}❌ Output mismatch!${RESET}"
  echo "Differences:"
  cat diff.txt
fi

rm -f "$EXPECTED_FILE" "$ACTUAL_FILE" diff.txt

