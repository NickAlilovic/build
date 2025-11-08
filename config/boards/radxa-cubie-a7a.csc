# Allwinner octa core 2xA76 6xA55 2-16GB LPDDR5 eMMC/UFS/NVMe
BOARD_NAME="radxa cubie a7a"
BOARDFAMILY="sun60iw2"
BOARD_MAINTAINER=""
BOOTCONFIG="radxa-cubie-a7a_defconfig"
OVERLAY_PREFIX="dtbo"
BOOT_LOGO="desktop"
KERNEL_TARGET="legacy"
SRC_EXTLINUX="yes"
UBOOT_EXTLINUX_ROOT="root=UUID=%%ROOT_PARTUUID%%"
SRC_CMDLINE="earlycon=sunxi-uart,0x02500000,115200 console=ttyAS0,115200n8 console=tty0 video=HDMI-A-1:1920x1080@60e fbcon=map:0 rootwait coherent_pool=2M irqchip.gicv3_pseudo_nmi=0 cgroup_enable=cpuset cgroup_memory=1 cgroup_enable=memory swapaccount=1 kasan=off"
BOOTSCRIPT="extlinux.conf"
UBOOT_EXTLINUX_FDT="dtb/allwinner/sun60i-a733-cubie-a7a.dtb"
# Force explicit DTB path in extlinux.conf (not fdtdir auto-detect)
BOOT_FDT_FILE="allwinner/sun60i-a733-cubie-a7a.dtb"
# Override initrd name - booti requires raw initrd for ARM64, not uInitrd wrapper
NAME_INITRD="initrd.img-5.15.147-legacy-sun60iw2"
# Disable uInitrd wrapper - booti requires raw initrd for ARM64
EXTLINUX_UINITRD="no"
IMAGE_PARTITION_TABLE="gpt"
#IMAGE_PARTITION_TABLE="msdos"
BOOTFS_TYPE="fat"
# U-Boot writes boot_package.fex at 12MiB, so boot partition must start after that
OFFSET=16
BOOTSTART="1"
BOOTSIZE="512"
ROOTSTART="513"
