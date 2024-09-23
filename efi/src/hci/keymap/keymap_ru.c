/** @file
 *
 * "ru" keyboard mapping
 *
 * This file is automatically generated; do not edit
 *
 */

FILE_LICENCE ( PUBLIC_DOMAIN );

#include <ipxe/keymap.h>

/** "ru" basic remapping */
static struct keymap_key ru_basic[] = {
	{ 0x0d, 0x0a },	/* Ctrl-M => Ctrl-J */
	{ 0xdc, 0x3c },	/* Pseudo-'\\' => '<' */
	{ 0xfc, 0x3e },	/* Pseudo-'|' => '>' */
	{ 0, 0 }
};

/** "ru" AltGr remapping */
static struct keymap_key ru_altgr[] = {
	{ 0, 0 }
};

/** "ru" keyboard map */
struct keymap ru_keymap __keymap = {
	.name = "ru",
	.basic = ru_basic,
	.altgr = ru_altgr,
};
