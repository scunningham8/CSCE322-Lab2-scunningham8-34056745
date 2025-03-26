%{
    #include <stdio.h>
%}

%%

    /* b.i */
[^aeiou]*a[^aeiou]*e[^aeiou]*i[^aeiou]*o[^aeiou]*u[^aeiou]* {
    printf("Token: <VOWEL_PATTERN>; Lexeme: %s\n", yytext);
}

    /* b.ii */
[0-9]+(\.[0-9]+)? {
    printf("Token: <NUMBER>; Lexeme: %s\n", yytext);
}

[\t\n]+ {}
. {}
%%

int yywrap(){
    return 1;
}

int main(){
    yylex();
    return 0;
}