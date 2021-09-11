SUMMARY = "A console-only image that fully supports the target device \
hardware."

IMAGE_FEATURES += "splash"
IMAGE_INSTALL += "opencv"
PACKAGECONFIG_pn-opencv="eigen jpeg libav png tiff"
LICENSE = "MIT"

inherit core-image
