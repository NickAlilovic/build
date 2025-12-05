# Allwinner H618 quad core 1/2/4GB RAM SoC WiFi SPI USB-C
BOARD_NAME="Orange Pi Zero3"
BOARDFAMILY="sun50iw9"
BOARD_MAINTAINER=""
BOOTCONFIG="orangepi_zero3_defconfig"
OVERLAY_PREFIX="sun50i-h616"
BOOT_LOGO="desktop"
KERNEL_TARGET="edge,dev"
FORCE_BOOTSCRIPT_UPDATE="yes"
BOOTFS_TYPE="fat"

enable_extension "uwe5622-allwinner"

function post_family_tweaks__orangepi_zero3() {
    display_alert "$BOARD" "Installing board tweaks" "info"
	cp -R $SRC/packages/blobs/sunxi/h618/armbian-audio-config $SDCARD/usr/lib/armbian
	cp -R $SRC/packages/blobs/sunxi/h618/armbian-audio-config $SDCARD/lib/armbian
	
	return 0
}
