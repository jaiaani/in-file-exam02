// Assignment name  : repeat_alpha
// Expected files   : repeat_alpha.c
// Allowed functions: write
// --------------------------------------------------------------------------------
//
// Write a program called repeat_alpha that takes a string and displays it
// repeating each alphabetical character as many times as its alphabetical index,
// followed by a newline.
//
// 'a' becomes 'a', 'b' becomes 'bb', 'e' becomes 'eeeee', etc...
//
// Case remains unchanged.
//
// If the number of arguments is not 1, just display a newline.
//
// Examples:
//
// $>./repeat_alpha "abc"
// abbccc
// $>./repeat_alpha "Alex." | cat -e
// Alllllllllllleeeeexxxxxxxxxxxxxxxxxxxxxxxx.$
// $>./repeat_alpha 'abacadaba 42!' | cat -e
// abbacccaddddabba 42!$
// $>./repeat_alpha | cat -e
// $
// $>./repeat_alpha "" | cat -e
// $

#include <unistd.h>

// 🔧 Write your logic inside main
int	main(int argc, char **argv)
{
	// TODO: Write the logic for repeat_alpha
	(void)argc;
	(void)argv;
	write(1, "\n", 1);
	return (0);
}


