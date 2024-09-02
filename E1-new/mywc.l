%{
#include <stdio.h>
int chars = 0, words = 0, lines = 0;
%}

%%
\n         lines++;
[ \t]      chars++;
[^\t\n ]+  { words++; chars += yyleng; }
%%

int main(int argc, char **argv)
{
    yylex();
    printf("%8d%8d%8d\n", lines, words, chars);
    return 0;
}

int yywrap(void)
{
    return 1;
}
