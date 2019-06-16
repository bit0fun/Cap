#ifndef CAPC_TARGETS_H
#define CAPC_TARGETS_H


/* Includes for target */
#define TARGET_INC	"targets/fusion.h"

/* What supported targets are available */
enum supported_targets {
	x86,
	AMD64,
	arm,
	thumb,
	aarch64,
	fusion,
	max_num_targets /* Total number of targets supported */
};


#endif /* CAPC_TARGETS_H */
