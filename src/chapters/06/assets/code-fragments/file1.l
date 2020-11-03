%{
%}

non_white	[^ \t\n]*

%%

{non_white}	ECHO;
.		;
[\n]		;

%%