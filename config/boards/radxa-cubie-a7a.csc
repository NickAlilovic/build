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
enable_extension "radxa-aic8800"
AIC8800_TYPE="usb"

function post_family_tweaks__radxa_preset_configs() {
	display_alert "$BOARD" "preset configs for rootfs" "info"
	# Set PRESET_NET_CHANGE_DEFAULTS to 1 to apply any network related settings below
	echo "PRESET_NET_CHANGE_DEFAULTS=1" > "${SDCARD}"/root/.not_logged_in_yet

	# Enable WiFi or Ethernet.
	#      NB: If both are enabled, WiFi will take priority and Ethernet will be disabled.
	echo "PRESET_NET_ETHERNET_ENABLED=1" >> "${SDCARD}"/root/.not_logged_in_yet
	echo "PRESET_NET_WIFI_ENABLED=1" >> "${SDCARD}"/root/.not_logged_in_yet

	#Enter your WiFi creds
	#      SECURITY WARN: Your wifi keys will be stored in plaintext, no encryption.
	echo "PRESET_NET_WIFI_SSID='MySSID'" >> "${SDCARD}"/root/.not_logged_in_yet
	echo "PRESET_NET_WIFI_KEY='MyWiFiKEY'" >> "${SDCARD}"/root/.not_logged_in_yet

	#      Country code to enable power ratings and channels for your country. eg: GB US DE | https://en.wikipedia.org/wiki/ISO_3166-1_alpha-2
	echo "PRESET_NET_WIFI_COUNTRYCODE='US'" >> "${SDCARD}"/root/.not_logged_in_yet

	#If you want to use a static ip, set it here
	echo "PRESET_NET_USE_STATIC=1" >> "${SDCARD}"/root/.not_logged_in_yet
	echo "PRESET_NET_STATIC_IP='192.168.0.100'" >> "${SDCARD}"/root/.not_logged_in_yet
	echo "PRESET_NET_STATIC_MASK='255.255.255.0'" >> "${SDCARD}"/root/.not_logged_in_yet
	echo "PRESET_NET_STATIC_GATEWAY='192.168.0.1'" >> "${SDCARD}"/root/.not_logged_in_yet
	echo "PRESET_NET_STATIC_DNS='8.8.8.8 8.8.4.4'" >> "${SDCARD}"/root/.not_logged_in_yet

	# Preset user default shell, you can choose bash or  zsh
	echo "PRESET_USER_SHELL=bash" >> "${SDCARD}"/root/.not_logged_in_yet

	# Set PRESET_CONNECT_WIRELESS=y if you want to connect wifi manually at first login
	echo "PRESET_CONNECT_WIRELESS=y" >> "${SDCARD}"/root/.not_logged_in_yet

	# Set SET_LANG_BASED_ON_LOCATION=n if you want to choose "Set user language based on your location?" with "n" at first login
	echo "SET_LANG_BASED_ON_LOCATION=y" >> "${SDCARD}"/root/.not_logged_in_yet

	# Preset default locale
	echo "PRESET_LOCALE=en_US.UTF-8" >> "${SDCARD}"/root/.not_logged_in_yet

	# Preset timezone
	echo "PRESET_TIMEZONE=Etc/UTC" >> "${SDCARD}"/root/.not_logged_in_yet

	# Preset root password
	echo "PRESET_ROOT_PASSWORD=radxa" >> "${SDCARD}"/root/.not_logged_in_yet

	# Preset username
	echo "PRESET_USER_NAME=radxa" >> "${SDCARD}"/root/.not_logged_in_yet

	# Preset user password
	echo "PRESET_USER_PASSWORD=radxa" >> "${SDCARD}"/root/.not_logged_in_yet

	# Preset user default realname
	echo "PRESET_DEFAULT_REALNAME=Radxa" >> "${SDCARD}"/root/.not_logged_in_yet
}
