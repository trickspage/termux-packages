TERMUX_PKG_HOMEPAGE=https://github.com/rcr/rirc
TERMUX_PKG_DESCRIPTION="A terminal IRC client in C"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=0.1.6
TERMUX_PKG_SRCURL=https://github.com/rcr/rirc/archive/refs/tags/v${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=95ac4fa4538d42509c5ef763afd6b85882f5b8bc0e45dced7b0cb9916961243e
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_configure() {
	make config.h
}

