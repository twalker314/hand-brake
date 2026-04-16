#!/bin/zsh
## git commit -m "contrib: update all except ffmpeg, x264, x265 to match master" -- contrib
## git diff --stat <branch> -- contrib/amf contrib/bzip2 contrib/fdk-aac contrib/freetype contrib/fribidi contrib/harfbuzz contrib/jansson contrib/lame contrib/libass contrib/libbluray contrib/libdav1d contrib/libdvdnav contrib/libdvdread contrib/libgnurx contrib/libiconv contrib/libjpeg-turbo contrib/libmfx contrib/libogg contrib/libopus contrib/libspeex contrib/libtheora contrib/libvorbis contrib/libvpl contrib/libvpx contrib/libxml2 contrib/nvenc contrib/sse2neon contrib/svt-av1 contrib/xz contrib/zimg contrib/zlib
for contrib in \
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
	do git rm -r -f -- "$contrib" && git checkout origin/master -- "$contrib"
done
git rm -r -f -- "contrib/libmfx"   && git checkout b6a7f999cabb400ec005478762c877ec85a9f0ab -- "contrib/libmfx"   ## latest version before removal in f922d8c28ea0f2ef9a951daca4f52f49550c5817
git rm -r -f -- "contrib/libxml2"  && git checkout e655792871aebae780f8d2d339f9763f0dd72c45 -- "contrib/libxml2"  ## latest version before removal in e4496d247868648a4960878a6339a93a31224212
git rm -r -f -- "contrib/sse2neon" && git checkout ee0f7438a30fdc6dc0b184b57c08c72effcead81 -- "contrib/sse2neon" ## latest version before removal in ab102ae76dc413f1517e678e14db48473dd95b57
