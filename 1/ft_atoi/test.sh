#!/bin/bash

# Define colors
GREEN='\033[0;32m'
RED='\033[0;31m'
RESET='\033[0m'

echo "🔧 Compiling ft_atoi.c..."
gcc -Wall -Wextra -Werror ft_atoi.c -o ft_atoi

if [ $? -ne 0 ]; then
    echo -e "${RED}❌ Compilation failed.${RESET}"
    exit 1
fi

echo -e "\n🚀 Running tests and comparing the output:"

# Test case 1
output=$(./ft_atoi "42")
expected="42"
if [ "$output" -eq "$expected" ]; then
    echo -e "${GREEN}Test 1 passed${RESET}"
else
    echo -e "${RED}Test 1 failed: expected $expected, got $output${RESET}"
fi

# Test case 2
output=$(./ft_atoi "   -123")
expected="-123"
if [ "$output" -eq "$expected" ]; then
    echo -e "${GREEN}Test 2 passed${RESET}"
else
    echo -e "${RED}Test 2 failed: expected $expected, got $output${RESET}"
fi

# Test case 3
output=$(./ft_atoi "+7")
expected="7"
if [ "$output" -eq "$expected" ]; then
    echo -e "${GREEN}Test 3 passed${RESET}"
else
    echo -e "${RED}Test 3 failed: expected $expected, got $output${RESET}"
fi

# Test case 4
output=$(./ft_atoi "00123")
expected="123"
if [ "$output" -eq "$expected" ]; then
    echo -e "${GREEN}Test 4 passed${RESET}"
else
    echo -e "${RED}Test 4 failed: expected $expected, got $output${RESET}"
fi

# Test case 5
output=$(./ft_atoi "abc")
expected="0"  # Assuming ft_atoi returns 0 for non-numeric strings
if [ "$output" -eq "$expected" ]; then
    echo -e "${GREEN}Test 5 passed${RESET}"
else
    echo -e "${RED}Test 5 failed: expected $expected, got $output${RESET}"
fi

# Test case 6
output=$(./ft_atoi "  -42abc")
expected="-42"
if [ "$output" -eq "$expected" ]; then
    echo -e "${GREEN}Test 6 passed${RESET}"
else
    echo -e "${RED}Test 6 failed: expected $expected, got $output${RESET}"
fi

# Test case 7
output=$(./ft_atoi "2147483647")
expected="2147483647"
if [ "$output" -eq "$expected" ]; then
    echo -e "${GREEN}Test 7 passed${RESET}"
else
    echo -e "${RED}Test 7 failed: expected $expected, got $output${RESET}"
fi

# Test case 8
output=$(./ft_atoi "-2147483648")
expected="-2147483648"
if [ "$output" -eq "$expected" ]; then
    echo -e "${GREEN}Test 8 passed${RESET}"
else
    echo -e "${RED}Test 8 failed: expected $expected, got $output${RESET}"
fi

echo -e "\n✅ Tests completed."

