#!/bin/bash

GREEN="\033[0;32m"
RED="\033[0;31m"
RESET="\033[0m"

EXPECTED="expected_output.txt"
ACTUAL="actual_output.txt"

cat << EOF > $EXPECTED
abbccc
Alllllllllllleeeeexxxxxxxxxxxxxxxxxxxxxxxx.
abbacccaddddabba 42!
(empty)
(empty)
EOF

gcc -Wall -Wextra -Werror repeat_alpha.c -o repeat_alpha
if [ $? -ne 0 ]; then
	echo -e "${RED}❌ Compilation failed.${RESET}"
	exit 1
fi

{
	./repeat_alpha "abc"
	./repeat_alpha "Alex."
	./repeat_alpha "abacadaba 42!"
	./repeat_alpha
	./repeat_alpha ""
} | sed -e 's/^$/\(empty\)/' > $ACTUAL

if diff -u $EXPECTED $ACTUAL > diff.txt; then
	echo -e "${GREEN}✅ repeat_alpha passed! Output is correct.${RESET}"
else
	echo -e "${RED}❌ Output mismatch!${RESET}"
	cat diff.txt
fi

rm -f $EXPECTED $ACTUAL diff.txt

