# Allwinner H618 quad core 4GB RAM SoC WiFi USB
BOARD_NAME="Vontar H618"
BOARDFAMILY="sun50iw9"
BOARD_MAINTAINER=""
BOOTCONFIG="vontar_h618_defconfig"
OVERLAY_PREFIX="sun50i-h616"
BOOT_LOGO="desktop"
KERNEL_TARGET="edge,dev"
FORCE_BOOTSCRIPT_UPDATE="yes"
BOOTFS_TYPE="fat"

function post_family_tweaks__vontar_h618() {
    display_alert "$BOARD" "Installing board tweaks" "info"
    
    	cp -Rdf $SRC/packages/blobs/station/firmware/brcm/* $SDCARD/lib/firmware/brcm
	cp -Rdf $SDCARD/lib/firmware/brcm/brcmfmac4334-sdio.rockchip,rk3318-box.txt  $SDCARD/lib/firmware/brcm/brcmfmac4334-sdio.txt
	touch $SDCARD/lib/firmware/brcm/brcmfmac4334-sdio.clm_blob
	ln -srf $SDCARD/lib/firmware/brcm/brcmfmac4334-sdio.bin      $SDCARD/lib/firmware/brcm/brcmfmac4334-sdio.vontar,h618.bin
	cp -R $SRC/packages/blobs/sunxi/h618/armbian-audio-config $SDCARD/usr/lib/armbian
	cp -R $SRC/packages/blobs/sunxi/h618/armbian-audio-config $SDCARD/lib/armbian

	return 0
}

function post_family_config_branch_edge__different_dtb_for_edge() {
    declare -g BOOT_FDT_FILE="allwinner/sun50i-h618-vontar-h618.dtb"
    display_alert "$BOARD" "Using ${BOOT_FDT_FILE} for ${BRANCH}" "info"
}
