%{
#include <stdio.h>
%}
%s A B C D DEAD

%%
<INITIAL>a BEGIN A;
<INITIAL>b BEGIN C;
<INITIAL>[^ab\n] BEGIN DEAD;
<INITIAL>\n BEGIN INITIAL; {printf("iNVALID\n");};

<A>a BEGIN A;
<A>b BEGIN B;
<A>[^ab\n] BEGIN DEAD;
<A>\n BEGIN INITIAL; {printf("accepted\n");};

<B>a BEGIN A;
<B>b BEGIN B;
<B>[^ab\n] BEGIN DEAD;
<B>\n BEGIN INITIAL; {printf("invalied\n");}

<C>a BEGIN D;
<C>b BEGIN C;
<C>[^ab\n] BEGIN DEAD;
<C>\n BEGIN INITIAL; {printf("accepted\n");};

<D>a BEGIN D;
<D>b BEGIN C;
<D>[^ab\n] BEGIN DEAD;
<D>\n BEGIN INITIAL; {printf("invalied\n");}

<DEAD>[^\n] BEGIN DEAD;
<DEAD>\n BEGIN INITIAL; {printf("invalid\n");}


%%

int main()
{
    printf("enter the input: ");
    yylex();
}

int yywrap(void){
    return 1;
}