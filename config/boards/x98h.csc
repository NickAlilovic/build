# Allwinner H618 quad core 2GB RAM SoC WiFi USB
BOARD_NAME="X98H"
BOARDFAMILY="sun50iw9"
BOARD_MAINTAINER="Nick A"
BOOTCONFIG="x98h_defconfig"
OVERLAY_PREFIX="sun50i-h616"
BOOT_LOGO="desktop"
KERNEL_TARGET="edge"
FORCE_BOOTSCRIPT_UPDATE="yes"
BOOTFS_TYPE="fat"

function post_family_tweaks__x98h() {
	display_alert "Applying wifi firmware"
	pushd "$SDCARD/lib/firmware"
	ln -s "aic8800/SDIO/aic8800D80" "aic8800_sdio" # use armbian-firmware
	cp -R $SRC/packages/blobs/sunxi/h618/armbian-audio-config $SDCARD/usr/lib/armbian
	cp -R $SRC/packages/blobs/sunxi/h618/armbian-audio-config $SDCARD/lib/armbian
	popd
}

