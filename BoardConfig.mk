# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# inherit from Sony Common
include device/sony/common/BoardConfigCommon.mk

# inherit from Sony qcom-common
include device/sony/qcom-common/BoardConfigCommon.mk

# Include proprietary binaries/blobs from device
include vendor/sony/taoshan/BoardConfigVendor.mk

# Assert checking in CWM
TARGET_OTA_ASSERT_DEVICE := C2104,C2105,c2104,c2105,taoshan

# Include Path
TARGET_SPECIFIC_HEADER_PATH := device/sony/taoshan/include

# Platform
TARGET_BOOTLOADER_BOARD_NAME := qcom
TARGET_BOARD_PLATFORM := msm8960
BOARD_VENDOR_PLATFORM := taoshan


# Architecture
TARGET_ARCH_VARIANT_CPU := cortex-a9
TARGET_CPU_VARIANT := krait

# Flags
TARGET_GLOBAL_CFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon-vfpv4 -mfloat-abi=softfp
COMMON_GLOBAL_CFLAGS += -D__ARM_USE_PLD -D__ARM_CACHE_LINE_SIZE=64

# Krait optimizations
TARGET_USE_KRAIT_BIONIC_OPTIMIZATION := true
TARGET_USE_KRAIT_PLD_SET      := true
TARGET_KRAIT_BIONIC_PLDOFFS   := 10
TARGET_KRAIT_BIONIC_PLDTHRESH := 10
TARGET_KRAIT_BIONIC_BBTHRESH  := 64
TARGET_KRAIT_BIONIC_PLDSIZE   := 64

# Kernel information
BOARD_KERNEL_BASE     := 0x80200000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_CMDLINE  := console=ttyHSL0,115200,n8 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3 maxcpus=2
BOARD_MKBOOTIMG_ARGS  := --ramdisk_offset 0x02000000

# CyanogenMod Inline-kernel building stuff (Disable this for ROM's without this feature)
TARGET_KERNEL_CONFIG := cyanogenmod_taoshan_defconfig
TARGET_KERNEL_SOURCE := kernel/sony/msm8x30

# Dumpstate
BOARD_LIB_DUMPSTATE := libdumpstate.sony

# WiFi Config
BOARD_HAS_QCOM_WLAN              := true
BOARD_WLAN_DEVICE                := qcwcn
WPA_SUPPLICANT_VERSION           := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME          := "wlan"
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"

BOARD_HARDWARE_CLASS := device/sony/taoshan/cmhw

# Camera
COMMON_GLOBAL_CFLAGS += -DQCOM_BSP_CAMERA_ABI_HACK -DMR0_CAMERA_BLOB
USE_DEVICE_SPECIFIC_CAMERA := true


# GPS
BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
TARGET_NO_RPC := true

# Bluetooth
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/sony/taoshan/bluetooth

# Needed for Pre-KK blobs to stop errors like this "_ZN7android10VectorImpl19reservedVectorImpl1Ev"
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

# USB/VOLD
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/msm_hsusb/gadget/lun%d/file

# Custom boot
BOARD_HAS_NO_SELECT_BUTTON := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_CUSTOM_BOOTIMG_MK := device/sony/taoshan/custombootimg.mk
# use large text on this device
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_10x18.h\"

TARGET_RECOVERY_FSTAB := device/sony/taoshan/rootdir/root/fstab.qcom
RECOVERY_FSTAB_VERSION := 2

BOARD_FLASH_BLOCK_SIZE := 131072

# QCOM/CAF hardware
COMMON_GLOBAL_CFLAGS += -DQCOM_HARDWARE
BOARD_USES_QCOM_HARDWARE := true
TARGET_QCOM_AUDIO_VARIANT := caf
TARGET_QCOM_DISPLAY_VARIANT := caf
TARGET_QCOM_MEDIA_VARIANT := caf

# Audio
BOARD_USES_ALSA_AUDIO := true
BOARD_USES_LEGACY_ALSA_AUDIO := true
TARGET_USES_QCOM_COMPRESSED_AUDIO := true
TARGET_USES_QCOM_MM_AUDIO := true
TARGET_LS_USE_ALS_NODE := true

# Partition information
BOARD_VOLD_MAX_PARTITIONS := 27
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x01400000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1258291200
BOARD_USERDATAIMAGE_PARTITION_SIZE := 1711276032
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456

BOARD_SEPOLICY_DIRS += \
    device/sony/taoshan/sepolicy

BOARD_SEPOLICY_UNION += \
    file_contexts \
    property_contexts \
    te_macros \
    bluetooth_loader.te \
    bridge.te \
    camera.te \
    device.te \
    dhcp.te \
    domain.te \
    drmserver.te \
    file.te \
    kickstart.te \
    init.te \
    mac_update.te \
    mediaserver.te \
    mpdecision.te \
    netmgrd.te \
    qmux.te \
    rild.te \
    rmt.te \
    surfaceflinger.te \
    system.te \
    tee.te \
    thermald.te \
    ueventd.te \
    wpa_supplicant.te

