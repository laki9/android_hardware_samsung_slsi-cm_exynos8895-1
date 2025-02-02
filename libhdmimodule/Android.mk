# Copyright (C) 2008 The Android Open Source Project
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

ifeq ($(filter-out exynos5,$(TARGET_BOARD_PLATFORM)),)

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)
#commented by liyang.zhang
#LOCAL_SHARED_LIBRARIES := liblog libutils libcutils libexynosutils libexynosv4l2 libsync libhdmi libdisplay
LOCAL_SHARED_LIBRARIES := liblog libutils libcutils libexynosutils libexynosv4l2 libsync libhdmi libexynosdisplay

LOCAL_C_INCLUDES := \
	$(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include \
	$(LOCAL_PATH)/../../exynos5/include \
	$(TOP)/hardware/samsung_slsi-cm/exynos/include \
	$(TOP)/hardware/samsung_slsi-cm/exynos/libexynosutils \
	$(TOP)/hardware/samsung_slsi-cm/$(TARGET_SOC)/include \
	$(TOP)/hardware/samsung_slsi-cm/$(TARGET_SOC)/libhwcmodule \
	$(TOP)/hardware/samsung_slsi-cm/exynos/libhwc \
	$(TOP)/hardware/samsung_slsi-cm/exynos/libhwcutils \
	$(TOP)/hardware/samsung_slsi-cm/exynos/libdisplay \
	$(TOP)/hardware/samsung_slsi-cm/exynos/libexynosdisplay

LOCAL_ADDITIONAL_DEPENDENCIES += \
	$(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr

ifeq ($(BOARD_HDMI_INCAPABLE), true)
LOCAL_C_INCLUDES += $(TOP)/hardware/samsung_slsi-cm/exynos/libhdmi_dummy
else
ifeq ($(BOARD_USES_NEW_HDMI), true)
LOCAL_C_INCLUDES += $(TOP)/hardware/samsung_slsi-cm/exynos/libhdmi
else
LOCAL_C_INCLUDES += $(TOP)/hardware/samsung_slsi-cm/exynos/libhdmi_legacy
endif
endif

LOCAL_SRC_FILES := \
	ExynosExternalDisplayModule.cpp

LOCAL_MODULE_TAGS := eng
LOCAL_MODULE := libhdmimodule
include $(BUILD_SHARED_LIBRARY)

endif
