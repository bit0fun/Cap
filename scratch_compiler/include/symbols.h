#ifndef CAPC_SYMBOLS_H
#define CAPC_SYMBOLS_H

#include <stdint.h>
#include "config.h"
#include "types.h"


/* How data can be accessed from memory */
enum sym_data_access {
	volitile,			/* Value of data can change at each access (read write) */
	constant,			/* Value of data will never change (read only) */
};


/* Structure for symbols.
 * Symbols can be defines or variables.
 * They contain an address where they can be loaded from, a value,
 * their required alignment, how large the value is, and how the
 * data can be accessed */
struct sym_t{
	ADDR_T					address;	/* Address of symbol */	
	uintmax_t				size;		/* Size of the symbol */
	uint32_t				alignment;	/* Alignment of data */
	enum sym_data_access	access;		/* How data can be accessed */
	uintmax_t				scope;		/* Scope of symbol */
};




#endif /* CAPC_SYMBOLS_H */
