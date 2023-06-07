%{
    #include<stdio.h>
    #include<string.h>
    int vowel=0,conso=0;
%}

%%
[ \t\n] {}
[aeiouAEIOU] {vowel++;}
[^aeiouAEIOU] {conso++;}
%%

int main(){
    /*
    
    */
    printf("Enter the stirng: ");
    yylex();
    printf("Number of vowels and consonants are: %d %d",vowel,conso);
}

int yywrap(){
    return 1;
}