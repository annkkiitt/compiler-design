 /*
 Program to implement odd zeroes and even one
 */

%{
#include <stdio.h>
#include <string.h>
%}

%s A B C DEAD

%%
<INITIAL>1 BEGIN A;
<INITIAL>0 BEGIN B;
<INITIAL>[^01\n] BEGIN DEAD;
<INITIAL>\n BEGIN INITIAL; {printf("NOT ACCEPETED\n");}

<A>1 BEGIN INITIAL;
<A>0 BEGIN C;
<A>[^01\n] BEGIN DEAD;
<A>\n BEGIN INITIAL;{printf("NOT ACCEPETED\n");}

<B>1 BEGIN C;
<B>0 BEGIN INITIAL;
<B>[^01\n] BEGIN DEAD;
<B>\n BEGIN INITIAL; {printf("ACCEPETED\n");}

<C>1 BEGIN B;
<C>0 BEGIN A;
<C>[^01\n] BEGIN DEAD;
<C>\n BEGIN INITIAL; {printf("NOT ACCEPETED\n");}

<DEAD>[^01\n] BEGIN DEAD;
<DEAD>\n BEGIN INITIAL; {printf("INVALID\n");}

%%

int main(){
    printf("Enter the string: ");
    yylex();
}

int yywrap(void){
    return 1;
}