%{
#include <iostream>
using namespace std;
#define YY_DECL extern "C" int yylex()
//#include "y.tab.h"
//extern int yylval;
%}

%%
"="                     { return EQ; }
"!="                    { return NE; }
"<"                     { return LT; }
"<="                    { return LE; }
">"                     { return GT; }
">="                    { return GE; }
"+"                     { return PLUS; }
"-"                     { return MINUS; }
"*"                     { return MULT; }
"/"                     { return DIVIDE; }
")"                     { return RPAREN; }
"("                     { return LPAREN; }
\"(\\.|[^\\"])*\"       { /*yylval = yytext[0] - 'a';*/ return STRING; }
[0-9]+                  { /*yylval = atoi(yytext);*/ return NUMBER; }
[a-zA-Z]+([0-9a-zA-Z])* { /*yylval = yytext[0] - 'a';*/ return ATOM; }
\                       { ; }
\n                      { ; }
\t                      { ; }
.                       { yyerror("illegal token"); }
%%

#ifndef yywrap
yywrap() { return 1; }
#endif
