TARGET := iphone:clang:latest:7.0
INSTALL_TARGET_PROCESSES = grindrx

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = GrindrEnhancer

GrindrEnhancer_FILES = $(wildcard *.xm *.m)
GrindrEnhancer_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk

clean::
	rm -rf .theos packages