#!/bin/bash

GREEN="\033[0;32m"
RED="\033[0;31m"
RESET="\033[0m"

EXPECTED="expected_camel_to_snake.txt"
ACTUAL="actual_camel_to_snake.txt"

cat << EOF > "$EXPECTED"
here_is_a_camel_case_word
hello_world
(empty)
EOF

gcc -Wall -Wextra -Werror camel_to_snake.c -o camel_to_snake
if [ $? -ne 0 ]; then
	echo -e "${RED}❌ Compilation failed.${RESET}"
	exit 1
fi

{
	./camel_to_snake "hereIsACamelCaseWord"
	./camel_to_snake "helloWorld"
	./camel_to_snake
} | sed -e 's/^$/\(empty\)/' > "$ACTUAL"

if diff -u "$EXPECTED" "$ACTUAL" > diff.txt; then
	echo -e "${GREEN}✅ camel_to_snake passed! Output is correct.${RESET}"
else
	echo -e "${RED}❌ Output mismatch!${RESET}"
	cat diff.txt
fi

rm -f "$EXPECTED" "$ACTUAL" diff.txt

