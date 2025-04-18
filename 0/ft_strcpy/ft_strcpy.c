// Assignment name  : ft_strcpy
// Expected files   : ft_strcpy.c
// Allowed functions: 
// --------------------------------------------------------------------------------
//
// Reproduce the behavior of the function strcpy (man strcpy).
//
// Your function must be declared as follows:
//
// char    *ft_strcpy(char *s1, char *s2);

char    *ft_strcpy(char *s1, char *s2)
{
	// TODO: Copy s2 into s1 and return s1
	(void)s1;
	(void)s2;
	return (0);
}


int main(void)
{
	char dest1[100];
	char dest2[100];
	char dest3[100];

	ft_strcpy(dest1, "Hello");
	ft_strcpy(dest2, "I should be the same on the other side...");
	ft_strcpy(dest3, "");

	printf("1: %s\n", dest1);
	printf("2: %s\n", dest2);
	printf("3: %s\n", dest3);

	return (0);
}
