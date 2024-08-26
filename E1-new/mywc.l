/* mywc.l */ 
%{
#include <stdio.h>
#include <ctype.h>

int num_lines = 0;
int num_words = 0;
int num_chars = 0;
%}

%%
\n                  { num_lines++; num_chars++; }
[ \t]+              { num_chars += yyleng; }
[A-Za-z0-9_]+       { num_words++; num_chars += yyleng; }
.                   { num_chars++; }
%%

int main(int argc, char **argv) {
    yylex();
    printf("Lines: %d\nWords: %d\nChars: %d\n", num_lines, num_words, num_chars);
    return 0;
}
