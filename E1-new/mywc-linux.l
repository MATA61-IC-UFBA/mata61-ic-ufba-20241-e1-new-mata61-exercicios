/* mywc.l */ 

%option noyywrap nodefault yylineno

%{
int chars = 0;
int words = 0;
int lines = 0;
%}

%%
[^ \t\n\r\f\v]+ { words++; chars += strlen(yytext); }
\n { chars++; lines++; }
. { chars++; }
%%

int main(int argc, char **argv)
{
   if(argc > 1) {
      if(!(yyin = fopen(argv[1], "r"))) {
         printf("error\n");
         return (1);
       }
   }
   yylex();
   printf("%8d%8d%8d %s\n", lines, words, chars, argv[1]);
}

