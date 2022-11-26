TERMUX_PKG_HOMEPAGE=https://github.com/cutefishos/terminal
TERMUX_PKG_DESCRIPTION="CutefishOs terminal"
TERMUX_PKG_LICENSE="GPL-3.0"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=0.7
TERMUX_PKG_SRCURL=https://github.com/cutefishos/terminal/archive/${TERMUX_PKG_VERSION}/cutefish-terminal-${TERMUX_PKG_VERSION}.tar.gz
TERMUX_PKG_SHA256=5aaae498eb852278ef4665df656311ee963369a646308f6b965cf42cde690740
TERMUX_PKG_DEPENDS="fishui, qt5-qtsvg"
TERMUX_PKG_BUILD_DEPENDS="extra-cmake-modules, qt5-qttools, qt5-qtbase-cross-tools"
TERMUX_PKG_BUILD_IN_SRC=true
TERMUX_CMAKE_BUILD="Unix Makefiles"
