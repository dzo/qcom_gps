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

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

RPC_INC:=rpc_inc

source_files:= \
	src/loc_api_rpc_glue.c \
	src/loc_api_sync_call.c \
	src/loc_apicb_appinit.c \
	src/loc_api_fixup.c

LOCAL_SRC_FILES:= $(source_files)

LOCAL_CFLAGS:=-fno-short-enums
LOCAL_CFLAGS+=-DDEBUG -DUSE_QCOM_AUTO_RPC
LOCAL_CFLAGS+=$(GPS_FEATURES)

# for loc_api_fixup.c
LOCAL_CFLAGS+=-DADD_XDR_FLOAT -DADD_XDR_BOOL

LOCAL_SHARED_LIBRARIES:= \
	librpc \
	libutils \
	libcutils \
	libcommondefs

LOCAL_STATIC_LIBRARIES := \
	libloc_api_rpcgen

LOCAL_PRELINK_MODULE:= false

LOCAL_C_INCLUDES:= \
	$(LOCAL_PATH) \
	$(LOCAL_PATH)/rpc_inc \
	$(TARGET_OUT_HEADERS)/loc_api/rpcgen/inc \
	$(TARGET_OUT_HEADERS)/libcommondefs-rpc \
	$(TARGET_OUT_HEADERS)/libcommondefs/rpcgen/inc \
	$(TARGET_OUT_HEADERS)/librpc \
	$(TARGET_OUT_HEADERS)/libloc-rpc/rpc_inc \
	hardware/msm7k/librpc \

LOCAL_COPY_HEADERS_TO:= libloc_api-rpc-qc/$(RPC_INC)
LOCAL_COPY_HEADERS:= \
	$(RPC_INC)/loc_api_rpc_glue.h \
	$(RPC_INC)/loc_api_fixup.h \
	$(RPC_INC)/loc_api_sync_call.h \
	$(RPC_INC)/loc_apicb_appinit.h

LOCAL_MODULE:= libloc_api-rpc-qc

include $(BUILD_SHARED_LIBRARY)
