/*usuwanie z lancucha znakow o kodach z zakresu od a do b, a<b*/ 

#include <stdio.h> 		
#include <string.h>		
#include <stdlib.h>	
	
#include "x86_function.h" 	
		

int main(int argc, char *argv[])
{
	char *pText = (char *) 0;
	if (argc < 4)				
	{
		printf("Not enough arguments.\n"
			"Run program as \"%s <some alphanumeric text>\"\n"
			"Thanks ;-)", argv[0]);
		return -1;
	}
	
	pText = malloc(strlen(argv[1]) + 1);	// alloc mamory for copy of our text
	if (pText == NULL)
	{
		printf("Memory allocation failed.");
		return -1;
	}
	
	strcpy(pText, argv[1]);			
	
	x86_function(pText, argv[2][0], argv[3][0]);			
	
	printf("Original text & modified text:\n" "%s\n" "%s\n", argv[1], pText);
	
	free(pText);				
	
	return 0;
}

