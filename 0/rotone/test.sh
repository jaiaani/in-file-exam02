#!/bin/bash

GREEN="\033[0;32m"
RED="\033[0;31m"
RESET="\033[0m"

EXPECTED="expected_output.txt"
ACTUAL="actual_output.txt"

cat << EOF > "$EXPECTED"
bcd
Mft tubhjbjsft ev tubgg of tfoufou qbt upvkpvst usft cpo.
BlkiA aMLJKa , 23z 
(empty)
(empty)
EOF

gcc -Wall -Wextra -Werror rotone.c -o rotone
if [ $? -ne 0 ]; then
	echo -e "${RED}❌ Compilation failed.${RESET}"
	exit 1
fi

{
	./rotone "abc"
	./rotone "Les stagiaires du staff ne sentent pas toujours tres bon."
	./rotone "AkjhZ zLKIJz , 23y "
	./rotone
	./rotone ""
} | sed -e 's/^$/\(empty\)/' > "$ACTUAL"

if diff -u "$EXPECTED" "$ACTUAL" > diff.txt; then
	echo -e "${GREEN}✅ rotone passed! Output is correct.${RESET}"
else
	echo -e "${RED}❌ Output mismatch!${RESET}"
	cat diff.txt
fi

rm -f "$EXPECTED" "$ACTUAL" diff.txt

