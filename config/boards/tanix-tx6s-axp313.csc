# Allwinner H618 quad core 4GB RAM SoC WiFi USB
BOARD_NAME="Tanix TX6s AXP313"
BOARDFAMILY="sun50iw9"
BOARD_MAINTAINER=""
BOOTCONFIG="tanix_tx6s_axp313_defconfig"
OVERLAY_PREFIX="sun50i-h616"
BOOT_LOGO="desktop"
KERNEL_TARGET="edge,dev"
FORCE_BOOTSCRIPT_UPDATE="yes"
BOOTFS_TYPE="fat"

function post_family_tweaks__tanix_tx6s_axp313() {
    display_alert "$BOARD" "Installing board tweaks" "info"

	cp -Rdf $SRC/packages/blobs/station/firmware/brcm/* $SDCARD/lib/firmware/brcm
	touch $SDCARD/lib/firmware/brcm/brcmfmac4334-sdio.clm_blob
	ln -srf $SDCARD/lib/firmware/brcm/brcmfmac-ap6330-sdio.bin      $SDCARD/lib/firmware/brcm/brcmfmac-ap6330-sdio.tanix,tx6s.bin
	cp -R $SRC/packages/blobs/sunxi/h618/armbian-audio-config $SDCARD/usr/lib/armbian
	cp -R $SRC/packages/blobs/sunxi/h618/armbian-audio-config $SDCARD/lib/armbian

	return 0
}
