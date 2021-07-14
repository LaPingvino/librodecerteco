#!/bin/bash
export ext=$1
[ "x$ext" == "x" ] && export ext=pdf
(
	for file in [0-9][0-9]*.md
	do
		sed -r 's/^([0-9]+)\. /***\1.*** /' $file | \
		sed -r "s/VERSIO/VERSIO $(git log --oneline | head -c 6)/"
		echo
		echo "\\pagebreak"
		echo
	done
) > final.md

pandoc final.md --pdf-engine=xelatex -s -o kitabiiqan.$ext
