%{
  #include <stdio.h>
  #include <stdlib.h>
  void yyerror(char *);
  int yylex(void);
  int result;
%}

%token NUMBER
%token PLUS MINUS MULTIPLY DIVIDE LPAREN RPAREN

%left PLUS MINUS
%left MULTIPLY DIVIDE
%right UMINUS

%%

program:
  program expr '\n' { printf("Restult: %d\n", $2); }
  | 
  ;

expr:
  NUMBER { $$ = $1; }
  | expr PLUS expr  { $$ = $1 + $3; }
  | expr MINUS expr { $$ = $1 - $3; }
  | expr MULTIPLY expr { $$ = $1 * $3; }
  | expr DIVIDE expr {
    if ($3 == 0) {
        yyerror("Error: Division by 0");
        $$ = 0;
    } else {
        $$ = $1 / $3;
    }
  }
  | MINUS expr %prec UMINUS { $$ = -$2; } 
  | LPAREN expr RPAREN { $$ = $2; }
  ;

%%

void yyerror(char *s) {
  fprintf(stderr, "%s\n", s);
}

int main(void) {
  yyparse();
  return 0;
}
