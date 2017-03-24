%{
#include <math.h>
#include <stdio.h>
#include <stdlib.h>

extern int yylex();
extern int yylineno;
extern FILE *yyin;

int sym[26];
void yyerror(const char *s) {
    fprintf (stderr, "%s\n", s);
}
%}

%union {
	int ival;
	char *sval;
    char sindex;
}

%token COMMENT
%token EQEQ
%token NE
%token LT
%token LE
%token GT
%token GE
%token PLUS
%token MINUS
%token MULT
%token DIVIDE
%token RPAREN
%token LPAREN
%token DEFINE
%token LET
%token PRINT
%token READ
%token COND
%token CONS
%token REST
%token FIRST
%token EMPTY
%token WHITESPACE
%token IGNORE
%token ERROR

%token <ival> INT
%token <sval> STRING
%token <sindex> CONSTANT
%token <sindex> ATOM

%type<ival> expr atom list items def bool_expr program main statement print read arith_expr cond_expr cond_opts bool_expr_cond

%start program

%%

// TODO
// Lists
//   - first
//   - rest
//   - cons
//   - empty
// Conditionals
//   - cond
// Strings
//   - def block
//   - print string

program: main
         | program main
         ;

main: expr
         | def
         | statement
         ;

def: LPAREN DEFINE CONSTANT INT RPAREN {sym[$3] = $4;}
     | LPAREN LET ATOM INT RPAREN {sym[$3] = $4;}
     ;

statement: print
           | read
           ;

print: LPAREN PRINT atom RPAREN {printf("%d", $3);}
       //| LPAREN PRINT STRING RPAREN {printf("%s", $3);}
       ;

read: LPAREN READ ATOM RPAREN {scanf("%d", &sym[$3]);}
      ;

expr: atom
      | list
      | bool_expr
      | arith_expr
      | cond_expr
      ;

bool_expr: LPAREN GE atom atom RPAREN {$$ = ($3>=$4); ($3>=$4) ? printf("true\n") : printf("false\n");}
           | LPAREN GT atom atom RPAREN {$$ = ($3>$4); ($3>$4) ? printf("true\n") : printf("false\n");}
           | LPAREN LE atom atom RPAREN {$$ = ($3<=$4); ($3<=$4) ? printf("true\n") : printf("false\n");}
           | LPAREN LT atom atom RPAREN {$$ = ($3<$4); ($3<$4) ? printf("true\n") : printf("false\n");}
           | LPAREN NE atom atom RPAREN {$$ = ($3!=$4); ($3!=$4) ? printf("true\n") : printf("false\n");}
           | LPAREN EQEQ atom atom RPAREN {$$ = ($3==$4); ($3==$4) ? printf("true\n") : printf("false\n");}
           ;

arith_expr: LPAREN PLUS atom atom RPAREN {$$ = $3 + $4; printf("%d\n", $3 + $4);}
            | LPAREN MINUS atom atom RPAREN {$$ = $3 - $4; printf("%d\n", $3 - $4);}
            | LPAREN MULT atom atom RPAREN {$$ = $3 * $4; printf("%d\n", $3 * $4);}
            | LPAREN DIVIDE atom atom RPAREN {$$ = $3 / $4; printf("%d\n", $3 / $4);}
            ;

cond_expr: LPAREN COND cond_opts RPAREN
           ;

cond_opts: LPAREN bool_expr_cond atom RPAREN {if($2){printf("%d", $3);}}
           | cond_opts LPAREN bool_expr_cond atom RPAREN {if($3){printf("%d", $4);}}
           ;

bool_expr_cond: LPAREN GE atom atom RPAREN {$$ = ($3>=$4);}
                | LPAREN GT atom atom RPAREN {$$ = ($3>$4);}
                | LPAREN LE atom atom RPAREN {$$ = ($3<=$4);}
                | LPAREN LT atom atom RPAREN {$$ = ($3<$4);}
                | LPAREN NE atom atom RPAREN {$$ = ($3!=$4);}
                | LPAREN EQEQ atom atom RPAREN {$$ = ($3==$4);}
                ;

list: LPAREN items RPAREN
      | LPAREN RPAREN
      ;

items: expr
       | expr items
       ;

atom: //EMPTY
      //| FIRST
      //| REST
      //| CONS
      //| COND
      //| STRING {$$=$1;}
      INT {$$=$1;}
      | ATOM {$$=sym[$1];}
      | CONSTANT {$$=sym[$1];}
      ;

%%

main() {
  do {
    yyparse();
  } while (1);
}
