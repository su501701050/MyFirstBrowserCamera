FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
CORE_EXTRA_IMAGES_INSTALL += "lighttpd-module-fastcgi lighttpd-module-cgi"
RDEPENDS:${PN} += "lighttpd-module-fastcgi lighttpd-module-cgi"
             
SRC_URI += "file://form1.html \
            file://form1.py3 \
            file://camera.html \
            file://camera.py3 \
            file://led.py3 \
            file://catch.html \
            file://haarcascades/ \
            "
                      
do_install:append() {
	install -m 0755 ${WORKDIR}/form1.html ${D}/www/pages/form1.html
	install -m 0755 ${WORKDIR}/form1.py3 ${D}/www/pages/form1.py3
	install -m 0755 ${WORKDIR}/camera.html ${D}/www/pages/camera.html
	install -m 0755 ${WORKDIR}/camera.py3 ${D}/www/pages/camera.py3
	install -m 0755 ${WORKDIR}/catch.html ${D}/www/pages/catch.html
	install -m 0755 ${WORKDIR}/led.py3 ${D}/usr/games/led.py3
		
	install -d ${D}/www/pages/haarcascades
	cp -r --no-dereference --preserve=mode,links -v ${WORKDIR}/haarcascades/* ${D}/www/pages/haarcascades/
}

FILES:${PN} += "/www/pages/haarcascades"
