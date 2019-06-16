#ifndef CAPC_FUSION_TGT_H
#define CAPC_FUSION_TGT_H
#include <stdint.h>

/* Defines required for targets */
#define TARGET_ADDR_T uint32_t			/* Address word size */
#define TARGET_WORD_T uint32_t			/* Word size*/

#define TARGET_REQ_ALIGN 0

#define TARGET_NUM_REGISTERS 31			/* Total number of registers available
										 * to allocate to */

/* Register mapping */
enum target_registers {
	zero,
	gp1,
	gp2,
	gp3,



};


#endif /* CAPC_FUSION_TGT_H */
