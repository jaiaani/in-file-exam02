// Assignment name  : ft_putstr
// Expected files   : ft_putstr.c
// Allowed functions: write
// --------------------------------------------------------------------------------
//
// Write a function that displays a string on the standard output.
//
// The pointer passed to the function contains the address of the string's first
// character.
//
// Your function must be declared as follows:
//
// void	ft_putstr(char *str);

#include <unistd.h>

// 🔧 Implement your function here
void	ft_putstr(char *str)
{
	//Write code here
	(void)str;
}

int	main(void)
{
	ft_putstr("Hello, World!\n");
	ft_putstr("777\n");
	ft_putstr("");
	ft_putstr("\nNice, it seems to be working :)\n");
	return (0);
}

