%{
#include "parser.tab.h"
#include <stdlib.h>
#include <stdio.h>
%}

COMMENT ";;".*
EQEQ "=="
NE "!="
LT "<"
LE "<="
GT ">"
GE ">="
PLUS "+"
MINUS "-"
MULT "*"
DIVIDE "/"
RPAREN ")"
LPAREN "("
DEFINE "define"
LET "let"
PRINT "print"
READ "read"
COND "cond"
CONS "cons"
REST "rest"
FIRST "first"
EMPTY "empty"
STRING \"(\\.|[^\\"])*\"
INT [0-9]+
ATOM [a-zA-Z]+([0-9a-zA-Z])*
WHITESPACE [ ]
IGNORE [\t\n\r]
ERROR .

%%
[\t]

{COMMENT} { }
{EQEQ} { printf("EQEQ "); }
{NE} { printf("NE "); }
{LT} { printf("LT "); }
{LE} { printf("LE "); }
{GT} { printf("GT "); }
{GE} { printf("GE "); }
{PLUS} { printf("PLUS "); }
{MINUS} { printf("MINUS "); }
{MULT} { printf("MULT "); }
{DIVIDE} { printf("DIVIDE "); }
{RPAREN} { printf("RPAREN "); }
{LPAREN} { printf("LPAREN "); }
{DEFINE} { printf("DEFINE "); }
{LET} { printf("LET "); }
{PRINT} { printf("PRINT "); }
{READ} { printf("READ "); }
{COND} { printf("COND "); }
{CONS} { printf("CONS "); }
{REST} { printf("REST "); }
{FIRST} { printf("FIRST "); }
{EMPTY} { printf("EMPTY "); }
{STRING} { printf("STRING "); }
{INT} { printf("INT "); }
{ATOM} { printf("ATOM "); }
{WHITESPACE} { printf("WHITESPACE "); }
{IGNORE} { printf("IGNORE "); }
{ERROR} { printf("ERROR "); }

%%
