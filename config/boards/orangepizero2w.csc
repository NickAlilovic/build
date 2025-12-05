# Allwinner H618 quad core 1GB/1.5GB/2GB/4GB RAM
BOARD_NAME="Orange Pi Zero2W"
BOARDFAMILY="sun50iw9"
BOARD_MAINTAINER=""
BOOTCONFIG="orangepi_zero2w_defconfig"
BOOT_LOGO="desktop"
OVERLAY_PREFIX="sun50i-h616"
KERNEL_TARGET="edge,dev"
FORCE_BOOTSCRIPT_UPDATE="yes"
BOOTFS_TYPE="fat"

enable_extension "uwe5622-allwinner"

function post_family_tweaks__orangepi_zero2w() {
    display_alert "$BOARD" "Installing board tweaks" "info"
	cp -R $SRC/packages/blobs/sunxi/h618/armbian-audio-config $SDCARD/usr/lib/armbian
	cp -R $SRC/packages/blobs/sunxi/h618/armbian-audio-config $SDCARD/lib/armbian
	
	return 0
}
