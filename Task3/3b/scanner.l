%{
#include <stdio.h>
#include <stdlib.h>
#include "y.tab.h"
%}

%%

[0-9]+      { yylval = atoi(yytext); return NUMBER; }
\+          { return PLUS; }
\-          { return MINUS; }
\*          { return MULTIPLY; }
\/          { return DIVIDE; }
\(          { return LPAREN; }
\)          { return RPAREN; }
\n          { return '\n'; }
[ \t]+      { }
.           { printf("Unrecognized character: %s\n", yytext); }

%%

int yywrap(void) {
    return 1;
}
