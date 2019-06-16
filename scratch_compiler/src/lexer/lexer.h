#ifndef CAP_LEXER_H
#define CAP_LEXER_H

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>


extern uintmax_t current_line;
extern uintmax_t current_char;

/* State machine for lexing the input string */
enum lex_state {
	LS_NULL,		
	LS_ERR,			/* Error occurred with lexing current line */
	LS_MAX

};

/* Function to determine how to handle specific line
 *
 * Returns: current lexing state; used to tell parser what to do
 * */
enum lex_state cap_lex( char* input_line, uintmax_t input_line_len );

#endif /* CAP_LEXER_H */
