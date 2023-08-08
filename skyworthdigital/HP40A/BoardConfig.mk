#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/skyworthdigital/HP40A

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a53
TARGET_CPU_VARIANT_RUNTIME := cortex-a53
TARGET_CPU_SMP := true

TARGET_USES_64_BIT_BINDER := true

# APEX
OVERRIDE_TARGET_FLATTEN_APEX := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := HP40AX2
TARGET_NO_BOOTLOADER := true
TARGET_NO_RADIOIMAGE := true

# Display
TARGET_SCREEN_DENSITY := 320

# Kernel
BOARD_BOOTIMG_HEADER_VERSION := 2
BOARD_KERNEL_BASE := 0x01078000
BOARD_KERNEL_CMDLINE := androidboot.dynamic_partitions=true androidboot.dtbo_idx=0 androidboot.boot_devices=ffe07000.emmc buildvariant=user
BOARD_KERNEL_PAGESIZE := 2048
BOARD_RAMDISK_OFFSET := 0x03080000
BOARD_KERNEL_TAGS_OFFSET := 0x03080100
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOTIMG_HEADER_VERSION)
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_KERNEL_SEPARATED_DTBO := true
TARGET_KERNEL_CONFIG := HP40A_defconfig
TARGET_KERNEL_SOURCE := kernel/skyworthdigital/HP40A

# Kernel - prebuilt
TARGET_FORCE_PREBUILT_KERNEL := true
ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_MKBOOTIMG_ARGS += --dtb $(TARGET_PREBUILT_DTB)
BOARD_INCLUDE_DTB_IN_BOOTIMG := 
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
BOARD_KERNEL_SEPARATED_DTBO := true
endif

# Partitions
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216

# Hack to build success, the partition limit to: 20971520
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 25971520
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor
BOARD_SUPER_PARTITION_SIZE := 2149580800
BOARD_SUPER_PARTITION_GROUPS := skyworthdigital_dynamic_partitions
BOARD_SKYWORTHDIGITAL_DYNAMIC_PARTITIONS_PARTITION_LIST := system vendor product odm
BOARD_SKYWORTHDIGITAL_DYNAMIC_PARTITIONS_SIZE := 2149580800
BOARD_EXT4_SHARE_DUP_BLOCKS := true

# Platform
TARGET_BOARD_PLATFORM := g12a
TARGET_SOC := s905x2
TARGET_BOARD_PLATFORM_GPU := mali-g31mp2


# Recovery
BOARD_INCLUDE_RECOVERY_DTBO := true
#TARGET_RECOVERY_PIXEL_FORMAT := BGRX_8888
#TARGET_RECOVERY_FORCE_PIXEL_FORMAT := "BGRA_8888"
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"
TARGET_RECOVERY_FORCE_PIXEL_FORMAT := "RGB_565"

# RECOVERY_GRAPHICS_USE_LINELENGTH := true
# RECOVERY_GRAPHICS_FORCE_USE_LINELENGTH := true

# Verified Boot
BOARD_AVB_ENABLE := false
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 3
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Hack: prevent anti rollback
# twrp-10 cannot set this value
#PLATFORM_SECURITY_PATCH := 2099-12-31
#VENDOR_SECURITY_PATCH := 2099-12-31
#PLATFORM_VERSION := 99.1.0

# TWRP Configuration
TW_THEME := landscape_hdpi
# TW_CUSTOM_THEME := $(DEVICE_PATH)/theme/landscape_hdpi

TW_EXTRA_LANGUAGES := false
TW_SCREEN_BLANK_ON_BOOT := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true

# my custom
BOARD_CACHEIMAGE_PARTITION_SIZE := false
# exclude mtp from twrp (disable if you are not able to fix it device/kernel side, safes some space)
TW_EXCLUDE_MTP := true
BOARD_HAS_NO_SELECT_BUTTON := true
#BOARD_HAS_LARGE_FILESYSTEM := true
# BOARD_HAS_NO_REAL_SDCARD := true

TW_EXCLUDE_SUPERSU := true                    # true/false: Add SuperSU or not

# Disable the battery percentage for devices where it doesn't work properly
TW_NO_BATT_PERCENT := true
# Same as above, for CPU Temperature
TW_NO_CPU_TEMP := true

# Set the path to the sysfs entry which controls the brightness
TW_BRIGHTNESS_PATH := "/sys/devices/platform/pwmleds/leds/pwm_led/brightness"

# disables things like sdcard partitioning and may save you some space if TWRP isn't fitting in your recovery patition
BOARD_HAS_NO_REAL_SDCARD := true

# TW_INCLUDE_NTFS_3G := false                    # Include NTFS Filesystem Support
# TW_INCLUDE_FUSE_EXFAT := false                 # Include Fuse-ExFAT Filesystem Support
# TWRP_INCLUDE_LOGCAT := false                   # Include LogCat Binary
# TW_INCLUDE_FB2PNG := false                     # Include Screenshot Support

# AB_OTA_UPDATER := false
# TARGET_RECOVERY_QCOM_RTC_FIX := false
# TW_INCLUDE_REPACKTOOLS := false
TW_NO_EXFAT := true
# TW_NO_EXFAT_FUSE := true
# TW_INCLUDE_DUMLOCK := false
# TW_NO_PARTITION_SD_CARD := true
TW_EXCLUDE_BASH := true
TW_EXCLUDE_NANO := true