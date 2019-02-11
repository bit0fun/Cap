#include "lexer.h"

enum lex_state cap_lex( char* input_line, uintmax_t input_line_len ){
	enum lex_state cstate = LS_NULL; 	/* Current State */
	char *token;						/* String tokens */
	char *s = input_line;				/* Input line offset */
	uintmax_t line_col = 0;				/* Column in current line */

	/** Tokenize input string **/

	/* Get rid of leading whitespace */
	while( (*s == '\n') || (*s == '\t') || (*s == '\r') || (*s == ' ') ){
		s++; /* Increment pointer to next spot */
		line_col++; /* keep track of current column */
		
		/* check if end of the line has been reached */
		if( line_col == input_line_len ){
			return LS_NULL;	/* nothing on this line, continue */
		}
	}
	
	/* After getting rid of leading whitespace */
	token = strtok( input_line, " "); /* Use space as delimiter */
	while( token ){
		/* Gotten token, need to figure out what needs to be done */	


		/* Get next token */
		token = strtok( NULL, " ");
	}

	/* Return current state */
	return cstate;

}
