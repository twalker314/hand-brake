#!/bin/zsh
for hbk in "${PWD}/build.macos/xroot/HandBrakeCLI"
do
	test -x "${hbk}" || \
	{
		echo "${hbk} not found or not executable"
		exit 1
	}
	for mix in quad
	do
		for src in /Volumes/hb-mixes/hb-a-mix/*"${mix}"*mkv
		do
			for enc in ac3 eac3 av_aac ca_aac ca_haac flac16 opus pcm16 vorbis
			do
				ext="mkv"
				test "${enc}" = "pcm16" && ext="mov" ## PCM in MKV has no layout information, decoder must guess
				rm -f -r -- "${HOME}/Downloads/test/${mix}/${enc}"
				mkdir -p -- "${HOME}/Downloads/test/${mix}/${enc}"
				"${hbk}"													\
					-i "${src}"												\
					-E "${enc}"												\
					-6 "${mix}"												\
					-o "${HOME}/Downloads/test/${mix}/${enc}/test.${ext}"	\
					2> "${HOME}/Downloads/test/${mix}/${enc}/test.log"
			done
		done
	done
	for mix in 7point1_sdds
	do
		for src in /Volumes/hb-mixes/hb-a-mix/*"${mix}"*mkv
		do
			for enc in alac16 ca_aac ca_haac flac16 pcm16
			do
				ext="mkv"
				test "${enc}" = "pcm16" && ext="mov" ## PCM in MKV has no layout information, decoder must guess
				rm -f -r -- "${HOME}/Downloads/test/${mix}/${enc}"
				mkdir -p -- "${HOME}/Downloads/test/${mix}/${enc}"
				"${hbk}"													\
					-i "${src}"												\
					-E "${enc}"												\
					-6 "${mix}"												\
					-o "${HOME}/Downloads/test/${mix}/${enc}/test.${ext}"	\
					2> "${HOME}/Downloads/test/${mix}/${enc}/test.log"
			done
		done
	done
done
