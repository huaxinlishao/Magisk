APP_ABI := armeabi-v7a x86
APP_CFLAGS := -Wall -Oz -fomit-frame-pointer -flto \
-D__MVSTR=${MAGISK_VERSION} -D__MCODE=${MAGISK_VER_CODE}
APP_LDFLAGS := -flto
APP_CPPFLAGS := -std=c++17
APP_STL := none
APP_PLATFORM := android-16

ifdef MAGISK_DEBUG
APP_CFLAGS += -D__MDBG
APP_STRIP_MODE := --strip-unneeded -w -K '!_ZNSt*' -K '!_ZNKSt*' -K '!_ZTVNSt*' -K '!__*' -K '!.*' -K '*'
endif

# Build 64 bit binaries
ifdef B_64BIT
APP_ABI += arm64-v8a x86_64
endif

# Busybox require some additional settings
ifdef B_BB
ifeq ($(OS),Windows_NT)
APP_SHORT_COMMANDS := true
endif
APP_PLATFORM := android-21
endif
