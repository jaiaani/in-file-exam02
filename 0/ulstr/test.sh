#!/bin/bash

GREEN="\033[0;32m"
RED="\033[0;31m"
RESET="\033[0m"

EXPECTED="expected_ulstr.txt"
ACTUAL="actual_ulstr.txt"

cat << EOF > "$EXPECTED"
l'EspRIT Ne PEuT PLuS PrOGrESsER S'iL STAgNE ET Si PErSiStENT vaNiTE ET AUTO-JUSTIFICATION.
s'ENtoUrER De SecREt EsT Un SigNe dE MaNqUe dE COnnAIssANcE.  
3:21 bA  ToUT  MOuN KI kA DI ke M'EN kA FE FOT
(empty)
EOF

gcc -Wall -Wextra -Werror ulstr.c -o ulstr
if [ $? -ne 0 ]; then
	echo -e "${RED}❌ Compilation failed.${RESET}"
	exit 1
fi

{
	./ulstr "L'eSPrit nE peUt plUs pRogResSer s'Il staGne et sI peRsIsTent VAnIte et auto-justification."
	./ulstr "S'enTOuRer dE sECreT eSt uN sIGnE De mAnQuE De coNNaiSSanCe.  "
	./ulstr "3:21 Ba  tOut  moUn ki Ka di KE m'en Ka fe fot"
	./ulstr
} | sed -e 's/^$/\(empty\)/' > "$ACTUAL"

if diff -u "$EXPECTED" "$ACTUAL" > diff.txt; then
	echo -e "${GREEN}✅ ulstr passed! Output is correct.${RESET}"
else
	echo -e "${RED}❌ Output mismatch!${RESET}"
	cat diff.txt
fi

rm -f "$EXPECTED" "$ACTUAL" diff.txt

