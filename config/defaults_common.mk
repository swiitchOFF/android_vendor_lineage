# notice to builders: 
# do not enable TARGET_IS_LOW_RAM if your device ram is greater than 4gb
# else OOM will most likely occur on operations where applications and camera can fill heap limit
# e.g uploading video/media on apps with camera preview
# this is a mitigation targets legacy devices 4gb below
# Using quicken is a trade-off: here we trade clean pages for dirty pages,
# extra cpu and battery. That's because the quicken files will be jit-ed in all
# the processes that load of shared apk and the code cache is not shared.
# Some notable apps that will be affected by this are gms and chrome.

TARGET_PRODUCT_PROP += \
    vendor/lineage/config/defaults_common.prop

ifneq ($(TARGET_FACE_UNLOCK_SUPPORTED),false)
ifeq ($(TARGET_SUPPORTS_GFU),true)
$(call inherit-product-if-exists, vendor/google/faceunlock/config.mk)
else
PRODUCT_PACKAGES += \
    FaceUnlock
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.face.sense_service=true
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.biometrics.face.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/android.hardware.biometrics.face.xml
endif
endif

PRODUCT_PACKAGES += \
    GameSpace \
    OmniJaws \
    AppLocker \
    EdgeLauncher \
    AxionWidgets \
    ColumbusService \
    AxThemePicker
