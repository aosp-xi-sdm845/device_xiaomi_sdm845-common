LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

ifneq ($(TARGET_TAP_TO_WAKE_NODE),)
    LOCAL_CFLAGS += -DTAP_TO_WAKE_NODE=\"$(TARGET_TAP_TO_WAKE_NODE)\"
endif

LOCAL_MODULE := android.hardware.power@1.2-service.xiaomi_sdm845
LOCAL_INIT_RC := android.hardware.power@1.2-service.xiaomi_sdm845.rc
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE_TAGS := optional

LOCAL_VENDOR_MODULE := true

LOCAL_SRC_FILES := \
    hint-data.c \
    list.c \
    metadata-parser.c \
    power-845.c \
    power-common.c \
    powerhintparser.c \
    Power.cpp \
    service.cpp \
    utils.c

LOCAL_C_INCLUDES := external/libxml2/include \
                    external/icu/icu4c/source/common \
                    $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include

LOCAL_SHARED_LIBRARIES := \
    android.hardware.power@1.2 \
    libbase \
    libcutils \
    libdl \
    libhidlbase \
    libhidltransport \
    liblog \
    libutils \
    libxml2

LOCAL_HEADER_LIBRARIES += libutils_headers
LOCAL_HEADER_LIBRARIES += libhardware_headers

LOCAL_ADDITIONAL_DEPENDENCIES := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr

LOCAL_CFLAGS += -Werror -Wall -Wno-unused-parameter
LOCAL_CFLAGS += -DINTERACTION_BOOST

include $(BUILD_EXECUTABLE)
