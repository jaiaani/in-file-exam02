#!/bin/bash

GREEN="\033[0;32m"
RED="\033[0;31m"
RESET="\033[0m"

EXPECTED="expected_output.txt"
ACTUAL="actual_output.txt"

cat << EOF > "$EXPECTED"
zaz
LIOP a 0bud
(empty)
EOF

gcc -Wall -Wextra -Werror rev_print.c -o rev_print
if [ $? -ne 0 ]; then
	echo -e "${RED}❌ Compilation failed.${RESET}"
	exit 1
fi

{
	./rev_print "zaz"
	./rev_print "dub0 a POIL"
	./rev_print
} | sed -e 's/^$/\(empty\)/' > "$ACTUAL"

# Comparar
if diff -u "$EXPECTED" "$ACTUAL" > diff.txt; then
	echo -e "${GREEN}✅ rev_print passed! Output is correct.${RESET}"
else
	echo -e "${RED}❌ Output mismatch!${RESET}"
	cat diff.txt
fi

rm -f "$EXPECTED" "$ACTUAL" diff.txt

