LOCAL_PATH := $(call my-dir)
LIBCAMERA_BUILD := shooter
include $(call all-subdir-makefiles)

include $(CLEAR_VARS)

LOCAL_MODULE_TAGS    := optional
LOCAL_MODULE_PATH    := $(TARGET_OUT_SHARED_LIBRARIES)

LOCAL_MODULE         := camera.$(TARGET_BOARD_PLATFORM)
LOCAL_SRC_FILES      := cameraHal.cpp
LOCAL_PRELINK_MODULE := false
CAMERA_LIB           := camera-inc

ifeq ($(LIBCAMERA_BUILD),nexus)
CAMERA_LIB := camera-shooter
endif

TARGET_GLOBAL_LD_DIRS  += -L$(LOCAL_PATH)
LOCAL_LDFLAGS   += -l${CAMERA_LIB} -lcameraSP
LOCAL_SHARED_LIBRARIES := liblog libdl libutils libcamera_client libbinder libcutils libhardware
LOCAL_C_INCLUDES       := frameworks/base/services/ frameworks/base/include
LOCAL_C_INCLUDES       += hardware/libhardware/include/ hardware/libhardware/modules/gralloc/

include $(BUILD_SHARED_LIBRARY)
