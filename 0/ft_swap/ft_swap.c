// Assignment name  : ft_swap
// Expected files   : ft_swap.c
// Allowed functions: 
// --------------------------------------------------------------------------------
//
// Write a function that swaps the contents of two integers the addresses of which
// are passed as parameters.
//
// Your function must be declared as follows:
//
// void	ft_swap(int *a, int *b);

void	ft_swap(int *a, int *b)
{
	//Write the code here 
	(void)a;
	(void)b;
}


#include <stdio.h>

void	ft_swap(int *a, int *b);

int	main(void)
{
	int x = 42;
	int y = 24;

	printf("Before swap: x = %d, y = %d\n", x, y);
	ft_swap(&x, &y);
	printf("After  swap: x = %d, y = %d\n", x, y);

	return (0);
}

