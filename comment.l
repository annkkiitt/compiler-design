%{
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
%}

%%
"//".*\n {}            
"/*"[^*/]*"*/" {}
%%

int main(){
    yyin = fopen("input.c","r");
    yyout = fopen("output.c","w");

    yylex();
}

int yywrap(){
    return 1;
}