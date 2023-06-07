%{
#include<stdio.h>
%}

%%
((http)|(ftp))s?:\/\/"www."[a-zA-Z0-9]{2,256}(\.[a-z]{2,3})+(\/[a-zA-Z0-9+=?]*)* {printf("\nURL Valid\n");}
  
.+ {printf("invalid url");}
%%

int main()
{
    printf("Enter the url: ");
    yylex();
}

int yywrap(void){
    return 1;
}