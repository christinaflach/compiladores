/* 
 * Template para programa flex.
 * Autora: Christina von Flach
 */

%option noyywrap nodefault yylineno

%{
#include "e1.tab.h"
%}

%%

"//".*                { /* void */ }

const                 { return CONST; }
int                   { return INT; }


[0-9]+                { return NUM; }
[a-zA-Z][a-zA-Z0-9_]* { return ID; }

"+"                   { return PLUS; }
"-"                   { return MINUS; }

[ \n\t]+              { /* void */ }

.                     { /* error: o que fazer aqui? */ } 

%%

/* Programa para simples conferência (ad-hoc) da saída yylex() */

int main(int argc, char **argv) {
    int token;
    const int N = 6; // número de classes de tokens: olhar programa .y

    // nomes das classes de token (só serve para mostrar e ajudar a conferir) 
    // array token_name precisa ser ajustado ao incluir outros token codes
    
    char *token_name[N] = {"CONST", "ID", "INT", "MINUS", "NUM", "PLUS"};

    while ((token = yylex())) {
       fprintf(stdout,"token code: %d", token);
       fprintf(stdout,", token class: %s", token_name[token-258]);
       fprintf(stdout,", lexeme: %s\n", yytext);
    }
}


