%{
    #include<stdio.h>
    #include<string.h>
    int lc=0,wc=0,sc=0;
%}

%%
[\n] {lc++;}
[ \t] {sc++;}
[^ \t\n]+ {wc++;}
%%

int main(){
    printf("Enter the stirng: ");
    yylex();
    printf("No. of line words and space are %d %d %d",lc,wc,sc);
}

int yywrap(){
    return 1;
}