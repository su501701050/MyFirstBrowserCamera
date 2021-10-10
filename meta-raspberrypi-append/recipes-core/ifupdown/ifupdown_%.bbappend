FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"

SRC_URI += "file://autoConnet@.service file://autoConnet.sh file://autoConnet.py3"

SYSTEMD_PACKAGES = "${PN}"
INITSCRIPT_PACKAGES = "${PN}"
SYSTEMD_SERVICE:${PN} = " autoConnet@.service"

do_install:append() {
    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
        install -d ${D}/${sbindir}
        install -m 0755 ${WORKDIR}/autoConnet.sh ${D}/${sbindir}
        
        install -d ${D}/${sbindir}
        install -m 0755 ${WORKDIR}/autoConnet.py3 ${D}/${sbindir}
        
        install -d ${D}${systemd_unitdir}/system/
        install -m 0644 ${WORKDIR}/autoConnet@.service ${D}${systemd_unitdir}/system/autoConnet@.service
        
        install -d ${D}${systemd_unitdir}/system/multi-user.target.wants
        
        ln -sf ${systemd_unitdir}/system/autoConnet@.service ${D}${systemd_unitdir}/system/multi-user.target.wants/autoConnet@.service
    fi 
}

FILES:${PN} += "/lib/systemd/system"
REQUIRED_DISTRO_FEATURES= "systemd"
