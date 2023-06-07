%{
#include<stdio.h>
%}

%%
"<"[^>]*> {fprintf(yyout,"%s\n",yytext);}
. ;
%%

int main()
{
    yyin = fopen("index.html","r");
    yyout = fopen("index.txt","w");
    yylex();
}

int yywrap(void){
    return 1;
}