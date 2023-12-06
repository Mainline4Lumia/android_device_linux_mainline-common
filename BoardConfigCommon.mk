#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

COMMON_PATH := device/linux/mainline-common

# Bootloader
TARGET_NO_BOOTLOADER := true

# Graphics
TARGET_USES_VULKAN := true

# Platform
TARGET_BOARD_PLATFORM := mainline
BOARD_USES_MAINLINE_HARDWARE := true

# Properties
TARGET_VENDOR_PROP += $(COMMON_PATH)/vendor.prop
ifeq ($(TARGET_DISPLAY_ENABLE_DRM),true)
TARGET_VENDOR_PROP += $(COMMON_PATH)/vendor_drm.prop
endif
ifeq ($(TARGET_DISPLAY_ENABLE_MESA),true)
TARGET_VENDOR_PROP += $(COMMON_PATH)/vendor_mesa.prop
endif

# Recovery
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# VINTF
DEVICE_MANIFEST_FILE += $(COMMON_PATH)/manifest.xml
ifeq ($(TARGET_DISPLAY_ENABLE_DRM),true)
DEVICE_MANIFEST_FILE += $(COMMON_PATH)/manifest_drm.xml
else
DEVICE_MANIFEST_FILE += $(COMMON_PATH)/manifest_fb.xml
endif

# Wi-Fi
WPA_SUPPLICANT_VERSION := VER_0_8_X
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211
