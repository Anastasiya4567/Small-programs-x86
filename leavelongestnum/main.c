/*usuwanie z lancuchu znakow poza najdluzsza liczba dziesietna*/

#include <stdio.h> 		
#include <string.h>		
#include <stdlib.h>		

#include "x86_function.h" 
				
				
int main(int argc, char *argv[])
{
	char *pText = (char *) 0;
	if (argc < 2)				
	{
		printf("Not enough arguments.\n"
			"Run program as \"%s <some alphanumeric text>\"\n"
			"Thanks ;-)", argv[0]);
		return -1;
	}
	
	pText = malloc(strlen(argv[1]) + 1);	
	if (pText == NULL)
	{
		printf("Memory allocation failed.");
		return -1;
	}
	
	strcpy(pText, argv[1]);			
	
	char* returnValue = x86_function(pText);			
	
	printf("Original text & modified text:\n""%s\n""%s\n", argv[1], returnValue);
	
	free(pText);				
	
	return 0;
}

