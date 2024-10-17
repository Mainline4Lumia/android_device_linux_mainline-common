#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@7.1-impl \
    android.hardware.audio.effect@7.0-impl \
    android.hardware.audio.service \
    android.hardware.bluetooth.audio-impl

PRODUCT_PACKAGES += \
    audio.bluetooth.default \
    audio.primary.default \
    audio.r_submix.default \
    audio.usb.default

# Audio configs
PRODUCT_COPY_FILES += \
    frameworks/av/services/audiopolicy/config/a2dp_in_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_in_audio_policy_configuration_7_0.xml \
    frameworks/av/media/libeffects/data/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration_7_0.xml \
    frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    frameworks/av/services/audiopolicy/config/bluetooth_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth_audio_policy_configuration_7_0.xml \
    frameworks/av/services/audiopolicy/config/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \
    frameworks/av/services/audiopolicy/config/msd_audio_policy_configuration_7_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/msd_audio_policy_configuration_7_0.xml \
    frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    frameworks/av/services/audiopolicy/config/surround_sound_configuration_5_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/surround_sound_configuration_5_0.xml \
    frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service \
    camera.v4l2

# Display
TARGET_DISPLAY_ENABLE_DRM ?= false
TARGET_DISPLAY_ENABLE_MESA ?= false

ifeq ($(TARGET_DISPLAY_ENABLE_DRM),true)
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator-service.minigbm \
    android.hardware.graphics.mapper@4.0-impl.minigbm \
    mapper.minigbm

PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.4-service \
    hwcomposer.drm
else
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.mapper@2.0-impl-2.1 \
    gralloc.default

PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.2-service
endif

PRODUCT_PACKAGES += \
    android.hardware.memtrack-service.example

PRODUCT_PACKAGES += \
    libEGL_angle \
    libGLESv1_CM_angle \
    libGLESv2_angle

PRODUCT_PACKAGES += \
    vulkan.pastel

PRODUCT_REQUIRES_INSECURE_EXECMEM_FOR_SWIFTSHADER := true

ifeq ($(TARGET_DISPLAY_ENABLE_MESA),true)
BOARD_GPU_DRIVERS := \
    etnaviv \
    freedreno \
    i915 \
    i965 \
    iris \
    kmsro \
    lima \
    nouveau \
    panfrost \
    r300g \
    r600g \
    swrast \
    virgl \
    vmwgfx \
    tegra

# Excluded drivers: \
    i915g (no idea what this is) \
    radeonsi (Even by linking it to libLLVM_android still doesn't build due to missing Python lib)

# Only works for a few drivers on downstream mesa3d
#PRODUCT_PACKAGES += \
    $(addprefix vulkan., $(BOARD_GPU_DRIVERS))

PRODUCT_PACKAGES += \
    libGLES_mesa
endif

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm-service.clearkey

# Health
PRODUCT_PACKAGES += \
    android.hardware.health-service.example \
    android.hardware.health-service.example_recovery

# Lights
PRODUCT_PACKAGES += \
    android.hardware.lights-service.example

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 34

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

ifeq ($(TARGET_DISPLAY_ENABLE_MESA),true)
PRODUCT_SOONG_NAMESPACES += \
    external/mesa3d
endif
