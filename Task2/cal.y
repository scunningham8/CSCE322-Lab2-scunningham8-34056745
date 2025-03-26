%{
  #include <stdio.h>
  #include <stdlib.h>
  void yyerror(char *);
  int yylex(void);
%}

%token NUMBER
%token PLUS MINUS

%left PLUS MINUS

%%
program:
  program expr '\n' {printf("Valid Syntax\n");}
  |
  ;

expr:
  NUMBER
  | expr PLUS expr  { }
  | expr MINUS expr { }
  ;
%%

void yyerror(char *s) {
  fprintf(stderr, "%s\n", s);
}

int main(void) {
  yyparse();
  return 0;
}
