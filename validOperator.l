%{
#include<stdio.h>
int flag=0;
%}

%%
[a-zA-Z0-9]+"@"[a-z]+".com"|".in" {flag=1;}
%%


// driver program
void main()
{
	printf("\nEnter URL : ");
	yylex();
	if(flag){
        printf("Valid email");
    }else{
        printf("inValid");
    }
}

int yywrap(void){
    return 1;
}
