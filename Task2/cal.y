%{
  #include <stdio.h>
  #include <stdlib.h>
  void yyerror(char *);
  int yylex(void);
%}

%token NUMBER
%token PLUS MINUS MULTIPLY DIVIDE LPAREN RPAREN

%left PLUS MINUS
%left MULTIPLY DIVIDE
%right UMINUS

%%

program:
  program expr '\n' { printf("Valid Syntax\n"); }
  | 
  ;

expr:
  NUMBER
  | expr PLUS expr  { }
  | expr MINUS expr { }
  | expr MULTIPLY expr { }
  | expr DIVIDE expr { }
  | MINUS expr %prec UMINUS { } 
  | LPAREN expr RPAREN { }
  ;

%%

void yyerror(char *s) {
  fprintf(stderr, "%s\n", s);
}

int main(void) {
  yyparse();
  return 0;
}
