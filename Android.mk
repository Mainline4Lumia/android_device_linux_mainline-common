#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(BOARD_USES_MAINLINE_HARDWARE),true)
include $(call all-makefiles-under,$(LOCAL_PATH))
endif
