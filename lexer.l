%{
#include <stdio.h>
%}

%%
";;".*                  printf("COMMENT ");
"="                     printf("EQ ");
"=="                    printf("EQEQ ");
"!="                    printf("NE ");
"<"                     printf("LT ");
"<="                    printf("LE ");
">"                     printf("GT ");
">="                    printf("GE ");
"+"                     printf("PLUS ");
"-"                     printf("MINUS ");
"*"                     printf("MULT ");
"/"                     printf("DIVIDE ");
")"                     printf("RPAREN ");
"("                     printf("LPAREN ");
\"(\\.|[^\\"])*\"       /*yylval = yytext[0] - 'a';*/ printf("STRING ");
[0-9]+                  /*yylval = atoi(yytext);*/ printf("NUMBER ");
[a-zA-Z]+([0-9a-zA-Z])* /*yylval = yytext[0] - 'a';*/ printf("ATOM ");
\                       ;
\n                      ;
\t                      ;
.                       printf("ERROR ");
%%

#ifndef yywrap
yywrap() { return 1; }
#endif
