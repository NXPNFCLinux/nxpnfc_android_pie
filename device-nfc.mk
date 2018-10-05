#####
##### NXP NFC Device Configuration makefile
######

NXP_NFC_HOST := $(TARGET_PRODUCT)
NXP_NFC_HW := pn7150
NXP_NFC_PLATFORM := pn54x
NXP_VENDOR_DIR := nxp

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.hcef.xml:system/etc/permissions/android.hardware.nfc.hcef.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml

# NFC config files
PRODUCT_COPY_FILES += \
    vendor/$(NXP_VENDOR_DIR)/nfc/hw/$(NXP_NFC_HW)/libnfc-nci.conf:vendor/etc/libnfc-nci.conf \
    vendor/$(NXP_VENDOR_DIR)/nfc/hw/$(NXP_NFC_HW)/libnfc-nxp.conf:vendor/etc/libnfc-nxp.conf \

# NFC Init Files
PRODUCT_COPY_FILES += \
     vendor/$(NXP_VENDOR_DIR)/nfc/hw/init.$(NXP_NFC_PLATFORM).nfc.rc:vendor/etc/init/hw/init.$(NXP_NFC_HOST).rc \

# NFC packages
PRODUCT_PACKAGES += \
    libnfc-nci \
    NfcNci \
    Tag \
    android.hardware.nfc@1.0-impl \
    nfc_nci.$(NXP_NFC_PLATFORM) \

PRODUCT_PACKAGES += \
	android.hardware.nfc@1.1-service \

ifeq ($(ENABLE_TREBLE), true)
PRODUCT_PACKAGES += \
	vendor.nxp.nxpnfc@1.0-impl \
	vendor.nxp.nxpnfc@1.0-service
endif

PRODUCT_PROPERTY_OVERRIDES += \
		ro.hardware.nfc_nci=$(NXP_NFC_PLATFORM)
#ro.product.first_api_level indicates the first api level, device has been commercially launched on.
PRODUCT_PROPERTY_OVERRIDES += \
ro.product.first_api_level=23

BOARD_SEPOLICY_DIRS += vendor/$(NXP_VENDOR_DIR)/nfc/sepolicy

ifneq (,$(wildcard vendor/$(NXP_VENDOR_DIR)/nfc/device-partial.mk))
include vendor/$(NXP_VENDOR_DIR)/nfc/device-partial.mk
endif
