%{
    #include <stdio.h>
%}

%%

[0-9]+ {
    printf("<NUMBER, %s>\n", yytext);
}

[-] {
    printf("<MINUS>\n");
}

[+] {
    printf("<PLUS>\n");
}

[\t\n] {}

. {
    printf("<UNKNOWN-TOKEN, %s>\n", yytext);
}
%%

int yywrap(){
    return 1;
}

int main(){
    yylex();
    return 0;
}