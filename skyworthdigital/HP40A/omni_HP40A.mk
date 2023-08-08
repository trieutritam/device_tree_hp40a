#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
#$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)
#$(call inherit-product, build/target/product/embedded.mk)

# Inherit some common Omni stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from HP40A device
$(call inherit-product, device/skyworthdigital/HP40A/device.mk)


PRODUCT_RELEASE_NAME := TWRP-HP40A
TW_DEVICE_VERSION := 1_HP40A_by_Tamtt
PRODUCT_DEVICE := HP40A
PRODUCT_NAME := omni_HP40A
PRODUCT_BRAND := ViettelTV
PRODUCT_MODEL := ViettelTV 4K Box
PRODUCT_MANUFACTURER := skyworthdigital

PRODUCT_GMS_CLIENTID_BASE := android-skyworthdigital-tv

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="HP4013-Viettel-tamtt release-keys"

BUILD_FINGERPRINT := ViettelTV/HP4013-Viettel/HP40A/tamtt/release-keys
