%{

int lineno = 1;

%}


%%

^.*\n   printf ("%4d)\t%s", lineno++, yytext);

%%