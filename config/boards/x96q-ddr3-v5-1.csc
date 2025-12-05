# V5.1 Allwinner H313 TVBox with 2GB of RAM and EMMC
BOARD_NAME="X96Q DDR3 V5.1"
BOARDFAMILY="sun50iw9"
BOARD_MAINTAINER=""
BOOTCONFIG="x96_q_ddr3_v5.1_defconfig"
BOOT_LOGO="desktop"
KERNEL_TARGET="edge"
KERNEL_TEST_TARGET="edge"
FORCE_BOOTSCRIPT_UPDATE="yes"
OVERLAY_PREFIX="sun50i-h616"
enable_extension "uwe5622-allwinner"
BOOTFS_TYPE="fat"

function post_family_config_branch_edge__different_dtb_for_edge() {
	declare -g BOOT_FDT_FILE="allwinner/sun50i-h313-x96-q-v5.1.dtb"
	display_alert "$BOARD" "Using ${BOOT_FDT_FILE} for ${BRANCH}" "info"
}
