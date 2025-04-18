// Assignment name  : first_word
// Expected files   : first_word.c
// Allowed functions: write
// --------------------------------------------------------------------------------
//
// Write a program that takes a string and displays its first word, followed by a
// newline.
//
// A word is a section of string delimited by spaces/tabs or by the start/end of
// the string.
//
// If the number of parameters is not 1, or if there are no words, simply display
// a newline.
//
// Examples:
//
// $> ./first_word "FOR PONY" | cat -e
// FOR$
// $> ./first_word "this        ...       is sparta, then again, maybe    not" | cat -e
// this$
// $> ./first_word "   " | cat -e
// $
// $> ./first_word "a" "b" | cat -e
// $
// $> ./first_word "  lorem,ipsum  " | cat -e
// lorem,ipsum$

#include <unistd.h>

// 🔧 Implement your logic here
void	first_word(char *str)
{
	// TODO: Write code that prints the first word using write
	(void) str;
}


#include <stdio.h>

int	main(int argc, char *argv[])
{
	if (argc != 2)
		return (0);
	printf("Should print the first word followed by a new line:\n");
	first_word(argv[1]);
}
