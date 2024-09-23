/** @file
 *
 * "lt" keyboard mapping
 *
 * This file is automatically generated; do not edit
 *
 */

FILE_LICENCE ( PUBLIC_DOMAIN );

#include <ipxe/keymap.h>

/** "lt" basic remapping */
static struct keymap_key lt_basic[] = {
	{ 0, 0 }
};

/** "lt" AltGr remapping */
static struct keymap_key lt_altgr[] = {
	{ 0x22, 0x5e },	/* '"' => '^' */
	{ 0x27, 0x5e },	/* '\'' => '^' */
	{ 0x4b, 0x26 },	/* 'K' => '&' */
	{ 0x51, 0x40 },	/* 'Q' => '@' */
	{ 0x71, 0x40 },	/* 'q' => '@' */
	{ 0, 0 }
};

/** "lt" keyboard map */
struct keymap lt_keymap __keymap = {
	.name = "lt",
	.basic = lt_basic,
	.altgr = lt_altgr,
};