# Allwinner A733 (sun60iw2) octa-core 1-16GB, WiFi6/BT, NPU, GPU, UFS
BOARD_NAME="Radxa Cubie A7S"
BOARD_VENDOR="radxa"
BOARDFAMILY="sun60iw2"
BOARD_MAINTAINER="NickAlilovic"
INTRODUCED="2025"
KERNEL_TARGET="vendor"
KERNEL_TEST_TARGET="vendor"
IMAGE_PARTITION_TABLE="msdos"
HAS_VIDEO_OUTPUT="no"

# --- Board-specific build configuration ---
BOOT_FDT_FILE="allwinner/sun60i-a733-cubie-a7s.dtb"

# WiFi/BT
# Adjust if A7S uses the same FCU760K module
MODULES="aic_load_fw_usb aic8800_fdrv_usb aic_btusb_usb"
PACKAGE_LIST_BOARD="rfkill bluetooth bluez bluez-tools"
AIC8800_TYPE="usb"
enable_extension "radxa-aic8800"

# Boot blobs extracted from Radxa A733 A7S image
SUNXI_BOOT0_SDCARD_FEX="${SRC}/packages/blobs/sunxi/sun60iw2/boot0_cubie-a7s.fex"
SUNXI_BOOT0_SPINOR_FEX="${SRC}/packages/blobs/sunxi/sun60iw2/boot0_cubie-a7s.fex"
SUNXI_SYS_CONFIG_FEX="${SRC}/packages/blobs/sunxi/sun60iw2/sys_config_cubie-a7s.fex"

UBOOT_HASH_EXTRA="$(cat "${SUNXI_BOOT0_SDCARD_FEX}" "${SUNXI_SYS_CONFIG_FEX}" | sha256sum | cut -d' ' -f1)"

function write_uboot_platform() {
	local SCRIPT_DIR="$1" DEVICE="$2"

	[[ -f "${SCRIPT_DIR}/boot0_sdcard.fex" ]] || {
		echo "write_uboot_platform: missing ${SCRIPT_DIR}/boot0_sdcard.fex" >&2
		return 1
	}

	[[ -f "${SCRIPT_DIR}/boot_package.fex" ]] || {
		echo "write_uboot_platform: missing ${SCRIPT_DIR}/boot_package.fex" >&2
		return 1
	}

	dd conv=notrunc,fsync status=none \
		if="${SCRIPT_DIR}/boot0_sdcard.fex" \
		of="${DEVICE}" bs=1k seek=128 ||
		{
			echo "write_uboot_platform: boot0 write failed" >&2
			return 1
		}

	dd conv=notrunc,fsync status=none \
		if="${SCRIPT_DIR}/boot_package.fex" \
		of="${DEVICE}" bs=1k seek=12288 ||
		{
			echo "write_uboot_platform: boot package write failed" >&2
			return 1
		}

	sync "${DEVICE}"
}
