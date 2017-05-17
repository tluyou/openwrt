#
# Copyright (C) 2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

define Profile/TLUYOU-X1
	NAME:=TLUYOU-X1
	PACKAGES:=\
		kmod-usb-core kmod-usb2 kmod-usb-ohci \
		kmod-ledtrig-usbdev
endef

define Profile/TLUYOU-X1/Description
	TLUYOU-X1 package set compatible with most boards.
endef
$(eval $(call Profile,TLUYOU-X1))
