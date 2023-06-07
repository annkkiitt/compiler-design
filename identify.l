%{
#include <stdio.h>
%}

%s A B C DEAD
%%
<INITIAL>[0-9]+ BEGIN A;
<INITIAL>[0-9]+[.][0-9]+ BEGIN B;
<INITIAL>[A-Za-z_][A-Za-z0-9_]+ BEGIN C;
<INITIAL>[^\n] BEGIN DEAD;
<INITIAL>[\n] BEGIN INITIAL; {printf("iNVALID\n");}

<A>[^\n] BEGIN DEAD;
<A>[\n] BEGIN INITIAL; {printf("INTEGER\n");}

<B>[^\n] BEGIN DEAD;
<B>[\n] BEGIN INITIAL; {printf("fLOAT\n");}

<C>[^\n] BEGIN DEAD;
<C>[\n] BEGIN INITIAL; {printf("IDENTIFIER\n");}

<DEAD>[^\n] BEGIN DEAD;
<DEAD>[\n] BEGIN INITIAL; {printf("INVALID\n");}
%%


int main()
{
    printf("Enter the expression: ");
    yylex();
}

int yywrap(void){
    return 1;
}