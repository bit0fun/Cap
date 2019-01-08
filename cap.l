/*** Definition Section ***/

%{
/* C code, verbatim */
#include "cap.tab.h"
//extern int yylex();
%}

/*** Rules Section ***/
%%
[ \t\n]		;
[0-9]+\.[0-9]+	{	yylval.vfloat = atof(yytext); return FLOAT;	}
[0-9]+			{	yylval.vint	= atoi(yytext); return INT; }
[a-zA-Z0-9]+	{	yylval.vstring = strdup(yytext); return STRING;	}

.				;
%%



