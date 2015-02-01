#
# This assumes AJTCL_ROOT points to a recent copy of the AJTCL Source.
#

# Set the local path
LOCAL_PATH := $(call my-dir)

# Clear other settings
include $(CLEAR_VARS)

# Echo information to be helpful
$(info > LOCAL_PATH = '$(LOCAL_PATH)')
$(info > AJTCL_ROOT = '$(AJTCL_ROOT)')

# Module name
LOCAL_MODULE := alljoyn

# C Source files
LOCAL_SRC_FILES := 	$(AJTCL_ROOT)/src/aj_about.c \
					$(AJTCL_ROOT)/src/aj_bufio.c \
					$(AJTCL_ROOT)/src/aj_bus.c \
					$(AJTCL_ROOT)/src/aj_cert.c \
					$(AJTCL_ROOT)/src/aj_connect.c \
					$(AJTCL_ROOT)/src/aj_crc16.c \
					$(AJTCL_ROOT)/src/aj_creds.c \
					$(AJTCL_ROOT)/src/aj_crypto.c \
					$(AJTCL_ROOT)/src/aj_debug.c \
					$(AJTCL_ROOT)/src/aj_disco.c \
					$(AJTCL_ROOT)/src/aj_guid.c \
					$(AJTCL_ROOT)/src/aj_init.c \
					$(AJTCL_ROOT)/src/aj_introspect.c \
					$(AJTCL_ROOT)/src/aj_keyauthentication.c \
					$(AJTCL_ROOT)/src/aj_keyexchange.c \
					$(AJTCL_ROOT)/src/aj_link_timeout.c \
					$(AJTCL_ROOT)/src/aj_msg.c \
					$(AJTCL_ROOT)/src/aj_nvram.c \
					$(AJTCL_ROOT)/src/aj_peer.c \
					$(AJTCL_ROOT)/src/aj_std.c \
					$(AJTCL_ROOT)/src/aj_util.c \
					$(AJTCL_ROOT)/src/aj_helper.c \
					$(AJTCL_ROOT)/crypto/aj_sw_crypto.c \
					$(AJTCL_ROOT)/crypto/ecc/aj_crypto_ecc.c \
					$(AJTCL_ROOT)/crypto/ecc/aj_crypto_sha2.c \
					$(AJTCL_ROOT)/external/sha2/sha2.c \
					android/aj_net.c \
					android/aj_target_crypto.c \
					android/aj_target_nvram.c \
					android/aj_target_util.c \
					android/ifaddrs.c \
					android/ifc_utils.c \
					alljoyn.c

# C Header files
LOCAL_C_INCLUDES := $(AJTCL_ROOT)/inc \
					$(AJTCL_ROOT)/external/sha2 \
					$(AJTCL_ROOT)/../android-ifaddrs \
					$(LOCAL_PATH)/android 

LOCAL_LDLIBS  := -llog
LOCAL_CFLAGS  := -UNDEBUG

# Echo more useful information
$(info > LOCAL_SRC_FILES = $(LOCAL_SRC_FILES))
$(info > LOCAL_C_INCLUDES = $(LOCAL_C_INCLUDES))
$(info > LOCAL_MODULE_FILENAME = $(LOCAL_MODULE_FILENAME))
$(info > LOCAL_LDLIBS = $(LOCAL_LDLIBS))

$(info > LOCAL_CFLAGS = $(LOCAL_CFLAGS))

# Build a static library
# include $(BUILD_STATIC_LIBRARY)
include $(BUILD_SHARED_LIBRARY)
