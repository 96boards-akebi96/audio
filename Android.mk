# Copyright (C) 2012 The Android Open Source Project
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

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_CFLAGS += -DMIXER_CARD=0
LOCAL_CFLAGS += -DPCM_CARD=0 -DPCM_DEVICE=0
LOCAL_CFLAGS += -DNUM_OF_CHANNELS=2
LOCAL_CFLAGS += -DOUT_PERIOD_SIZE=128
LOCAL_CFLAGS += -DOUT_LONG_PERIOD_COUNT=8
LOCAL_CFLAGS += -DOUT_SHORT_PERIOD_COUNT=2
LOCAL_CFLAGS += -DOUT_SAMPLING_RATE=48000
LOCAL_CFLAGS += -DALWAYS_ALSA_OPEN

LOCAL_MODULE := audio.primary.$(TARGET_BOOTLOADER_BOARD_NAME)
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_SRC_FILES := \
	audio_hw.c
LOCAL_C_INCLUDES += \
	external/tinyalsa/include \
	$(call include-path-for, audio-utils) \
	$(call include-path-for, audio-route)
LOCAL_SHARED_LIBRARIES := liblog libcutils libtinyalsa libaudioutils libaudioroute libhardware libutils
LOCAL_MODULE_TAGS := optional

ifeq ($(BOARD_VNDK_VERSION),current)
LOCAL_VENDOR_MODULE := true
endif
include $(BUILD_SHARED_LIBRARY)

