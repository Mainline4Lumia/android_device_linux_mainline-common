#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

COMMON_PATH := device/linux/mainline-common

# Bootloader
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := mainline
BOARD_USES_MAINLINE_HARDWARE := true

# Recovery
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# VINTF
DEVICE_MANIFEST_FILE += $(COMMON_PATH)/manifest.xml
