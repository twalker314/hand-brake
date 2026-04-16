#!/bin/zsh
git diff --stat origin/master -- \
	contrib/amf \
	contrib/bzip2 \
	contrib/fdk-aac \
	contrib/freetype \
	contrib/fribidi \
	contrib/harfbuzz \
	contrib/jansson \
	contrib/lame \
	contrib/libass \
	contrib/libbluray \
	contrib/libdav1d \
	contrib/libdvdnav \
	contrib/libdvdread \
	contrib/libgnurx \
	contrib/libiconv \
	contrib/libjpeg-turbo \
	contrib/libogg \
	contrib/libopus \
	contrib/libspeex \
	contrib/libtheora \
	contrib/libvorbis \
	contrib/libvpl \
	contrib/libvpx \
	contrib/nvenc \
	contrib/svt-av1 \
	contrib/xz \
	contrib/zimg \
	contrib/zlib
