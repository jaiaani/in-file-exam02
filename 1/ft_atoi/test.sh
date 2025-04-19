#!/bin/bash

echo "🔧 Compiling ft_atoi.c..."
gcc -Wall -Wextra -Werror ft_atoi.c -o ft_atoi

if [ $? -ne 0 ]; then
	echo "❌ Compilation failed."
	exit 1
fi

echo -e "\n🚀 Running tests:"
./ft_atoi

echo -e "\n✅ Tests completed (check the expected values manually as you implement the function)."

