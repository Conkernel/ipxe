#!/usr/bin/env bash

# Renombra el directorio ./bios con la fecha de modificación del archivo bios/src/bin/ipxe.pxe si existe
[ -d ./bios ] && mv ./bios ./bios_"$(date -r bios/README +'%d.%m.%Y')"


# Descargamos fuentes de github:
echo "Descargando fuentes de github..."
git clone https://github.com/netbootxyz/ipxe.git bios


cat > bios/src/config/local/console.h << EOF
#undef	CONSOLE_FRAMEBUFFER
#undef	CONSOLE_SYSLOG
#undef	CONSOLE_SYSLOGS
#undef	CONSOLE_VMWARE
#undef	CONSOLE_DEBUGCON
#undef	KEYBOARD_MAP
#undef	LOG_LEVEL
#define	CONSOLE_FRAMEBUFFER CONSOLE_USAGE_ALL
#define	CONSOLE_SYSLOG	CONSOLE_USAGE_ALL
#define	CONSOLE_SYSLOGS	CONSOLE_USAGE_ALL
#define	CONSOLE_VMWARE	CONSOLE_USAGE_ALL
#define	CONSOLE_DEBUGCON CONSOLE_USAGE_ALL
#define	KEYBOARD_MAP	es
#define	LOG_LEVEL	LOG_ALL
EOF


cat > bios/src/config/local/general.h << EOF
#undef BANNER_TIMEOUT
#define BANNER_TIMEOUT		10
#undef ROM_BANNER_TIMEOUT
#define ROM_BANNER_TIMEOUT	( 2 * BANNER_TIMEOUT )
#define NET_PROTO_IPV6
#define	NET_PROTO_FCOE
#define NET_PROTO_LLDP
#define	DOWNLOAD_PROTO_HTTPS
#define	DOWNLOAD_PROTO_FTP
#define	DOWNLOAD_PROTO_SLAM
#define	DOWNLOAD_PROTO_NFS
#define DOWNLOAD_PROTO_FILE
#define	SANBOOT_PROTO_ISCSI
#define	SANBOOT_PROTO_AOE
#define	SANBOOT_PROTO_IB_SRP
#define	SANBOOT_PROTO_FCP
#define	SANBOOT_PROTO_HTTP
#define	IMAGE_MULTIBOOT
#define	IMAGE_PXE
#define	IMAGE_SCRIPT
#define	IMAGE_BZIMAGE
#define	IMAGE_COMBOOT
//#define	IMAGE_EFI /* NO USAR CON BIOS */
#define	IMAGE_ZLIB
#define	IMAGE_GZIP
#define	IMAGE_UCODE
#undef	AUTOBOOT_CMD
#define	AUTOBOOT_CMD "dhcp"
#define	NVO_CMD
#define	CONFIG_CMD
#define	IFMGMT_CMD
#define	IWMGMT_CMD
#define IBMGMT_CMD
#define FCMGMT_CMD
#define	ROUTE_CMD
#define IMAGE_CMD
#define DHCP_CMD
#define SANBOOT_CMD
#define MENU_CMD
#define FORM_CMD
#define LOGIN_CMD
#define SYNC_CMD
#define SHELL_CMD
#define NSLOOKUP_CMD
#define TIME_CMD
#define DIGEST_CMD
#define LOTEST_CMD
#define VLAN_CMD
#define PXE_CMD
#define REBOOT_CMD
#define POWEROFF_CMD
#define IMAGE_TRUST_CMD
#define PCI_CMD
#define PARAM_CMD
#define NEIGHBOUR_CMD
#define PING_CMD
#define CONSOLE_CMD
#define IPSTAT_CMD
#define PROFSTAT_CMD
#define NTP_CMD
#define CERT_CMD
#define IMAGE_MEM_CMD
EOF


cat > bios/src/config/local/colour.h << EOF
#undef COLOR_NORMAL_FG
#undef COLOR_NORMAL_BG
#undef COLOR_SELECT_FG
#undef COLOR_SELECT_BG
#undef COLOR_SEPARATOR_FG
#undef COLOR_SEPARATOR_BG
#undef COLOR_EDIT_FG
#undef COLOR_EDIT_BG
#undef COLOR_ALERT_FG
#undef COLOR_ALERT_BG
#undef COLOR_URL_FG
#undef COLOR_URL_BG
#undef COLOR_PXE_FG
#undef COLOR_PXE_BG
#define COLOR_NORMAL_FG		COLOR_CYAN
#define COLOR_NORMAL_BG		COLOR_BLACK
#define COLOR_SELECT_FG		COLOR_WHITE
#define COLOR_SELECT_BG		COLOR_BLUE
#define COLOR_SEPARATOR_FG	COLOR_WHITE
#define COLOR_SEPARATOR_BG	COLOR_BLACK
#define COLOR_EDIT_FG		COLOR_BLACK
#define COLOR_EDIT_BG		COLOR_CYAN
#define COLOR_ALERT_FG		COLOR_WHITE
#define COLOR_ALERT_BG		COLOR_RED
#define COLOR_URL_FG		COLOR_CYAN
#define COLOR_URL_BG		COLOR_BLUE
#define COLOR_PXE_FG		COLOR_BLACK
#define COLOR_PXE_BG		COLOR_WHITE
EOF


cat > bios/src/config/local/crypto.h << EOF
#undef OCSP_CHECK
#define CRYPTO_DIGEST_MD5
EOF


# Para compilar:

cd bios/src/
make clean
make bin/ipxe.pxe
echo "EL FICHERO RESULTANTE ES $PWD/bin/ipxe.pxe"
