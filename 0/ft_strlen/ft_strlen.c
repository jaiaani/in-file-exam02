// Assignment name  : ft_strlen
// Expected files   : ft_strlen.c
// Allowed functions:
// --------------------------------------------------------------------------------
//
// Write a function that returns the length of a string.
//
// Your function must be declared as follows:
//
// int	ft_strlen(char *str);

int	ft_strlen(char *str)
{
	// TODO: Return the length of the string
	(void)str;
	return (0);
}

#include <stdio.h>


int	main(void)
{
	printf("1: %d\n", ft_strlen("Omgg Hii")); // 8
	printf("2: %d\n", ft_strlen(""));  // 0
	printf("3: %d\n", ft_strlen("Calma vida, ta de boa")); // 21
	printf("4: %d\n", ft_strlen("A\nB\nC")); // 5  
	return (0);
}

