#ifndef CAPC_CONFIG_H
#define CAPC_CONFIG_H
#include <stdint.h>
#include "targets.h"

/*** Target Options ***/

/** Target specific includes **/

#define HOST_IS_TARGET	1						/* Host machine and target 
												 * machine are the same */


/**  Word Size Definitions **/

/* Determine sizes using include file for cross compiler */
#if HOST_IS_TARGET == 0
#define ADDR_T 		TARGET_ADDR_T				/* Word size for address */
#define WORD_T 		TARGET_WORD_T				/* Word size for data */

#else
#define ADDR_T		uintmax_t
#define WORD_T		uintmax_t
#endif

/** Memory and Addressing Definitions **/
#define REQUIRE_ALIGNMENT	TARGET_REQ_ALIGN	/* Whether or not target 
												 * requires aligned addresses */


/** Register Configuration **/



#endif /* CAPC_CONFIG_H */
