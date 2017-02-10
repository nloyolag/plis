%{
#include <stdio.h>
%}

%%
";;".*                  printf("COMMENT ");
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
"define"                printf("DEFINE ");
"let"                   printf("LET ");
"print"                 printf("PRINT ");
"read"                  printf("READ ");
"cond"                  printf("COND ");
\"(\\.|[^\\"])*\"       /*yylval = yytext[0] - 'a';*/ printf("STRING ");
[0-9]+                  /*yylval = atoi(yytext);*/ printf("NUMBER ");
[a-zA-Z]+([0-9a-zA-Z])* /*yylval = yytext[0] - 'a';*/ printf("ATOM ");
[ ]                     printf("WHITESPACE ");
[\t\n\r]                printf("IGNORE ");
.                       printf("ERROR ");
%%

#ifndef yywrap
yywrap() { return 1; }
#endif
