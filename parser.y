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
%token <sindex> ATOM

//%type<ival> expr atom list items

%start program

%%

program: expr;

expr: atom
      | list
      ;

list: LPAREN items RPAREN
      | LPAREN RPAREN
      ;

items: expr
       | expr items
       ;

atom: EMPTY
      | FIRST
      | REST
      | CONS
      | COND
      | READ
      | PRINT
      | LET
      | DEFINE
      | DIVIDE
      | MULT
      | MINUS
      | PLUS
      | GE
      | GT
      | LE
      | LT
      | NE
      | EQEQ
      | STRING
      | INT
      | ATOM
      ;

%%
