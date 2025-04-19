#!/bin/bash

GREEN="\033[0;32m"
RED="\033[0;31m"
RESET="\033[0m"

EXPECTED="expected_output.txt"
ACTUAL="actual_output.txt"

cat << EOF > "$EXPECTED"
Popoche est un sobre
(empty)
zaz
(empty)
ZaZ eT David aiME le METal.
eNcOre Un ExEmPle Pas Facile a Ecrire 
EOF

gcc -Wall -Wextra -Werror search_and_replace.c -o search_and_replace
if [ $? -ne 0 ]; then
	echo -e "${RED}❌ Compilation failed.${RESET}"
	exit 1
fi

{
	./search_and_replace "Papache est un sabre" "a" "o"
	./search_and_replace "zaz" "art" "zul"
	./search_and_replace "zaz" "r" "u"
	./search_and_replace "jacob" "a" "b" "c" "e"
	./search_and_replace "ZoZ eT Dovid oiME le METol." "o" "a"
	./search_and_replace "wNcOre Un ExEmPle Pas Facilw a Ecrirw " "w" "e"
} | sed -e 's/^$/\(empty\)/' > "$ACTUAL"

if diff -u "$EXPECTED" "$ACTUAL" > diff.txt; then
	echo -e "${GREEN}✅ search_and_replace passed! Output is correct.${RESET}"
else
	echo -e "${RED}❌ Output mismatch!${RESET}"
	cat diff.txt
fi

rm -f "$EXPECTED" "$ACTUAL" diff.txt

