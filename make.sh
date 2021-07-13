#!/bin/bash
(
	for file in [0-9][0-9]*.md
	do
		cat $file
		echo
		echo "\\pagebreak"
		echo
	done
) | pandoc --pdf-engine=xelatex -s -o kitabiiqan.pdf
