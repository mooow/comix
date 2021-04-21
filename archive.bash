#!/bin/bash

[ $# -eq 0 ] && {
	echo Usage: $0 "<output directory>"
	exit 1
}

cd comix_out
for dir in *
do
	archive="$dir.tar.zst"

	[[ "$dir" == lost+found ]] && continue
	[ ! -d "$dir" ] && continue
	[ -f "${archive}" ] && continue
	echo "[$dir]"

	cd "$dir"
	rename 's/.*p(\d+.*)/$1/' *

	cd ..
	tar -cvf "${archive}" --zstd "${dir}"

	mega-put "${archive}" "$1"
done
