// Assignment name  : ft_atoi
// Expected files   : ft_atoi.c
// Allowed functions: None
// --------------------------------------------------------------------------------
//
// Write a function that converts the string argument str to an integer (type int)
// and returns it.
//
// It works much like the standard atoi(const char *str) function, see the man.
//
// Your function must be declared as follows:
//
// int	ft_atoi(const char *str);

#include <stdio.h>

// Implement your logic here

int	ft_atoi(const char *str)
{
	return (0); // <-- Placeholder
}

int	main(void)
{
	printf("Input: \"42\"        → Result: %d\n", ft_atoi("42"));
	printf("Input: \"   -123\"    → Result: %d\n", ft_atoi("   -123"));
	printf("Input: \"+7\"         → Result: %d\n", ft_atoi("+7"));
	printf("Input: \"00123\"      → Result: %d\n", ft_atoi("00123"));
	printf("Input: \"abc\"        → Result: %d\n", ft_atoi("abc"));
	printf("Input: \"  -42abc\"   → Result: %d\n", ft_atoi("  -42abc"));
	printf("Input: \"2147483647\" → Result: %d\n", ft_atoi("2147483647"));
	printf("Input: \"-2147483648\"→ Result: %d\n", ft_atoi("-2147483648"));
	return (0);
}

