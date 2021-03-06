/*
 * Copyright (C) 2022 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#pragma once

#include <aidl/android/hardware/light/BnLights.h>

namespace aidl {
namespace android {
namespace hardware {
namespace light {

class Lights : public BnLights {
public:
    ndk::ScopedAStatus setLightState(int id, const HwLightState& state) override;
    ndk::ScopedAStatus getLights(std::vector<HwLight>* types) override;
};

}  // namespace light
}  // namespace hardware
}  // namespace android
}  // namespace aidl
