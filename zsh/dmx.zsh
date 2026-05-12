#!/bin/zsh
test  -n "${1}" || exit 1 ## specify output folder (to compare output before vs. after patch)
mkdir -p "${1}" || exit 2
## note: comparison only makes sense for no-downmix scenario (quad to quad or sdds to sdds)
for mix in 7point1_sdds quad
do
	## note: not comparing opus or vorbis as output from consecutive encodes using the
	##       same codebase (be it before or after patch) appear to be nondeterministic
	for enc in ac3 alac16 av_aac ca_aac ca_haac eac3
	do
		test -f    "${HOME}/Downloads/test/${mix}/${enc}/test.mkv" || continue
		mkvextract "${HOME}/Downloads/test/${mix}/${enc}/test.mkv" tracks 1:"${1}/${mix}-${enc}-audio-bitstream"
	done
done
for mix in quad
do
	for enc in flac16 pcm16
	do
		## not comparing sdds as layout/channel mask change "7.1(wide)" to "7.1(wide-side)" also
		## changes the output channel order, affecting raw PCM bitstream in addition to metadata
		ffmpeg -i "${HOME}/Downloads/test/${mix}/${enc}/test.m"* -acodec pcm_s16le -f s16le -y "${1}/${mix}-${enc}-audio-bitstream"
	done
done
