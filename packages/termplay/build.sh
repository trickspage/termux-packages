TERMUX_PKG_HOMEPAGE=https://gitlab.com/jD91mZM2/termplay
TERMUX_PKG_DESCRIPTION="Play an image/video in your terminal"
TERMUX_PKG_LICENSE="MIT"
TERMUX_PKG_MAINTAINER="@termux"
TERMUX_PKG_VERSION=2.0.0
TERMUX_PKG_SRCURL=https://gitlab.com/jD91mZM2/termplay.git
TERMUX_PKG_DEPENDS="gstreamer, gst-plugins-bad, gst-plugins-base, gst-plugins-good , gst-plugins-ugly, libsixel"
TERMUX_PKG_BUILD_IN_SRC=true

termux_step_make() {
	termux_setup_rust
	cargo build --jobs $TERMUX_MAKE_PROCESSES --target $CARGO_TARGET_NAME --release --locked
}

termux_step_make_install() {
        install -Dm700 -t $TERMUX_PREFIX/bin target/${CARGO_TARGET_NAME}/release/termplay
}
