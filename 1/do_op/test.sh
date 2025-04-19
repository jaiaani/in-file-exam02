#!/bin/bash

GREEN="\033[0;32m"
RED="\033[0;31m"
RESET="\033[0m"

EXPECTED="expected_do_op.txt"
ACTUAL="actual_do_op.txt"

cat << EOF > "$EXPECTED"
56088
42
-42
(empty)
EOF

gcc -Wall -Wextra -Werror do_op.c -o do_op
if [ $? -ne 0 ]; then
	echo -e "${RED}❌ Compilation failed.${RESET}"
	exit 1
fi

{
	./do_op "123" "*" 456
	./do_op "9828" "/" 234
	./do_op "1" "+" "-43"
	./do_op
} | sed -e 's/^$/\(empty\)/' > "$ACTUAL"

if diff -u "$EXPECTED" "$ACTUAL" > diff.txt; then
	echo -e "${GREEN}✅ do_op passed! Output is correct.${RESET}"
else
	echo -e "${RED}❌ Output mismatch!${RESET}"
	cat diff.txt
fi

rm -f "$EXPECTED" "$ACTUAL" diff.txt

