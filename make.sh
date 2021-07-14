#!/bin/bash
(
	for file in [0-9][0-9]*.md
	do
		sed -r 's/^([0-9]+)\. /***\1.*** /' $file
		echo
		echo "\\pagebreak"
		echo
	done
) > final.md

pandoc final.md --pdf-engine=xelatex -s -o kitabiiqan.pdf
