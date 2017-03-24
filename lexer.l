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
{EQEQ} { return (EQEQ); }
{NE} { return (NE); }
{LT} { return (LT); }
{LE} { return (LE); }
{GT} { return (GT); }
{GE} { return (GE); }
{PLUS} { return (PLUS); }
{MINUS} { return (MINUS); }
{MULT} { return (MULT); }
{DIVIDE} { return (DIVIDE); }
{RPAREN} { return (RPAREN); }
{LPAREN} { return (LPAREN); }
{DEFINE} { return (DEFINE); }
{LET} { return (LET); }
{PRINT} { return (PRINT); }
{READ} { return (READ); }
{COND} { return (COND); }
{CONS} { return (CONS); }
{REST} { return (REST); }
{FIRST} { return (FIRST); }
{EMPTY} { return (EMPTY); }
{STRING} { yylval.sval = strdup(yytext); return (STRING); }
{INT} { yylval.ival = atoi(yytext); return (INT); }
{ATOM} { yylval.sindex = *yytext - 'a'; return (ATOM); }
{WHITESPACE} { }
{IGNORE} { }
{ERROR} { return (ERROR); }

%%
