FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
FILESPATH:prepend := "/home/raspberry/yocto/poky/rpi-build/workspace/sources/tzdata/oe-local-files:"
# srctreebase: /home/raspberry/yocto/poky/rpi-build/workspace/sources/tzdata

inherit externalsrc
# NOTE: We use pn- overrides here to avoid affecting multiple variants in the case where the recipe uses BBCLASSEXTEND
EXTERNALSRC:pn-tzdata = "/home/raspberry/yocto/poky/rpi-build/workspace/sources/tzdata"
EXTERNALSRC_BUILD:pn-tzdata = "/home/raspberry/yocto/poky/rpi-build/workspace/sources/tzdata"

DEFAULT_TIMEZONE ?="Asia/Tokyo"

# initial_rev: 3b3d7a45fc47abb4e5efd7d53cf34eacaf3ef35a
