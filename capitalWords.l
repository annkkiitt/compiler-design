%{
    #include<stdio.h>
    #include<string.h>
    int num=0;
%}


%%
[a-z]+[A-Z] {continue;}
[A-Z]+[ \t\n] {num++;printf("%s ",yytext);}
. ;
%%


int main(){
    printf("Enter the input string: ");
    yylex();

    printf("Number of capital words are : %d",num);
}

int yywrap(void){
return 1;
}

