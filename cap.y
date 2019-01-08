%{
#include <stdio.h>
#include <stdlib.h>

extern int yylex();
extern int yyparse();
extern FILE *yyin;

void yyerror(const char *s);
%}

%union {
	int 	vint;
	float	vfloat;
	char	*vstring;
}

%token <vint> INT
%token <vfloat> FLOAT
%token <vstring> STRING

%%
cap:
	INT cap {
		printf("Found int:\t%d\n", $1);
	}
	| FLOAT cap {
		printf("Found float:\t%f\n", $1);
	}
	| STRING cap {
		printf("Found string:\t%s\n", $1);
		free($1);
	}
	| INT {
		printf("Found int:\t%d\n", $1);
	}
	| FLOAT {
		printf("Found float:\t%f\n", $1);
	}
	| STRING {
		printf("Found string:\t%s\n", $1);
		free($1);
	}
;
%%

const char *usage = "Usage for capc\n"
					"capc filename.cap";

int main(int argc, char** argv){

	/* open file first to roead */
	if( argc < 2 ){
		printf("%s\n", usage);
		return -1;
	}	

	FILE *inputfp = fopen(argv[1],"r");
	if( inputfp == NULL){
		printf("Could not read file %s\n", argv[1]);
		return -1;
	}

	/* use file descriptor to lex */
	yyin = inputfp;

	/* lex through input */
//	while (yylex());
	yyparse();
}

void yyerror(const char *s){
	printf("Parsing error. %s\n", s);
	exit(-1);
}
