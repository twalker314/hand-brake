#!/bin/zsh
for i in "${HOME}"/Downloads/test/*/*/test.m*
do
	echo "${i:h}"
	ffprobe -strict 1 -i "${i}" 2>&1 | grep -e Audio
	tail -4 "${i:h}/test.log" | head -1
	echo
done > "${PWD}/checks.txt"
less   "${PWD}/checks.txt"
