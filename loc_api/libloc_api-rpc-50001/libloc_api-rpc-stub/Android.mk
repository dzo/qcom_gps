# Copyright (c) 2011, Code Aurora Forum. All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#     * Redistributions of source code must retain the above copyright
#       notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above
#       copyright notice, this list of conditions and the following
#       disclaimer in the documentation and/or other materials provided
#       with the distribution.
#     * Neither the name of Code Aurora Forum, Inc. nor the names of its
#       contributors may be used to endorse or promote products derived
#       from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESS OR IMPLIED
# WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NON-INFRINGEMENT
# ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS
# BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
# BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
# OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN
# IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

# functions
LOC_RPCGEN_APIS_PATH := $(TARGET_OUT_INTERMEDIATES)/loc_api/libloc_api_rpcgen_intermediates
LOC_RPCGEN_APIS_PATH_FL := ../../../../../$(TARGET_OUT_INTERMEDIATES)/loc_api/libloc_api_rpcgen_intermediates

LOCAL_MODULE := libloc_api_rpcgen

LOCAL_SHARED_LIBRARIES := \
    librpc \
    libcommondefs

LOCAL_SRC_FILES += \
    src/loc_api_rpcgen_cb_xdr.c \
    src/loc_api_rpcgen_common_xdr.c \
    src/loc_api_rpcgen_cb_svc.c \
    src/loc_apicb_appinit.c \
    src/loc_api_rpcgen_clnt.c \
    src/loc_api_rpcgen_xdr.c

LOCAL_C_INCLUDES += hardware/msm7k/librpc
LOCAL_C_INCLUDES += $(LOC_RPCGEN_APIS_PATH)/../../SHARED_LIBRARIES/libcommondefs_intermediates/inc
LOCAL_C_INCLUDES += $(LOCAL_PATH)/inc
LOCAL_C_INCLUDES += $(TARGET_OUT_HEADERS)/libcommondefs/rpcgen/inc
    
LOCAL_COPY_HEADERS_TO := loc_api/rpcgen/inc
LOCAL_COPY_HEADERS := inc/loc_api_rpcgen_rpc.h
LOCAL_COPY_HEADERS += inc/loc_api_rpcgen_common_rpc.h
LOCAL_COPY_HEADERS += inc/loc_api_rpcgen_cb_rpc.h
LOCAL_COPY_HEADERS += inc/loc_apicb_appinit.h

LOCAL_LDLIBS += -lpthread
LOCAL_PRELINK_MODULE := false
LOCAL_MODULE_TAGS:=user
include $(BUILD_STATIC_LIBRARY)
