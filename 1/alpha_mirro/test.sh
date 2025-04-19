#!/bin/bash

GREEN="\033[0;32m"
RED="\033[0;31m"
RESET="\033[0m"

EXPECTED="expected_alpha_mirror.txt"
ACTUAL="actual_alpha_mirror.txt"

cat << EOF > "$EXPECTED"
zyx
Nb slihv rh Znzarmt.
(empty)
EOF

gcc -Wall -Wextra -Werror alpha_mirror.c -o alpha_mirror
if [ $? -ne 0 ]; then
	echo -e "${RED}❌ Compilation failed.${RESET}"
	exit 1
fi

{
	./alpha_mirror "abc"
	./alpha_mirror "My horse is Amazing."
	./alpha_mirror
} | sed -e 's/^$/\(empty\)/' > "$ACTUAL"

if diff -u "$EXPECTED" "$ACTUAL" > diff.txt; then
	echo -e "${GREEN}✅ alpha_mirror passed! Output is correct.${RESET}"
else
	echo -e "${RED}❌ Output mismatch!${RESET}"
	cat diff.txt
fi

rm -f "$EXPECTED" "$ACTUAL" diff.txt

