#!/bin/bash

GREEN="\033[0;32m"
RED="\033[0;31m"
RESET="\033[0m"

EXPECTED="expected_output.txt"
ACTUAL="actual_output.txt"

cat << EOF > "$EXPECTED"
nop
Zl ubefr vf Nznmvat.
NxwuM mYXVWm , 23l 
(empty)
(empty)
EOF

gcc -Wall -Wextra -Werror rot_13.c -o rot_13
if [ $? -ne 0 ]; then
	echo -e "${RED}❌ Compilation failed.${RESET}"
	exit 1
fi

{
	./rot_13 "abc"
	./rot_13 "My horse is Amazing."
	./rot_13 "AkjhZ zLKIJz , 23y "
	./rot_13
	./rot_13 ""
} | sed -e 's/^$/\(empty\)/' > "$ACTUAL"

if diff -u "$EXPECTED" "$ACTUAL" > diff.txt; then
	echo -e "${GREEN}✅ rot_13 passed! Output is correct.${RESET}"
else
	echo -e "${RED}❌ Output mismatch!${RESET}"
	cat diff.txt
fi

rm -f "$EXPECTED" "$ACTUAL" diff.txt

