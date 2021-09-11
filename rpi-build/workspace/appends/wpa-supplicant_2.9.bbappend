FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
FILESPATH:prepend := "/home/raspberry/yocto/poky/rpi-build/workspace/sources/wpa-supplicant/oe-local-files:"
# srctreebase: /home/raspberry/yocto/poky/rpi-build/workspace/sources/wpa-supplicant

inherit externalsrc
# NOTE: We use pn- overrides here to avoid affecting multiple variants in the case where the recipe uses BBCLASSEXTEND
EXTERNALSRC:pn-wpa-supplicant = "/home/raspberry/yocto/poky/rpi-build/workspace/sources/wpa-supplicant"
EXTERNALSRC_BUILD:pn-wpa-supplicant = "/home/raspberry/yocto/poky/rpi-build/workspace/sources/wpa-supplicant"

# initial_rev: b3515724da554d72a837da2220bd7619a979c474
# commit: f628049939b9f52d584853e79a72773a855915d5
# commit: 64f0d5c07b5465f7b1e09af39b607152c7c19250
# commit: f18f8c31b6644e314ad0030a206519350ac39ba5
# commit: d5bcbad42ff5465a6bdf060073fd7aba93cf0087
# commit: d22f9800da537ce1cf7eed78369b0963eef97742
# commit: 53822d5b02351cf55ce75e6531ca0e7aa7e4b759
# commit: 08de9d5e96fa9490482e88e91889a19e2d85a848
# commit: dfb80b52740e5d2a909bb92b42721096e4cd7099
