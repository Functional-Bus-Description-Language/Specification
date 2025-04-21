fbdl.pdf: src/* src/functionalities/* src/images/*
	typst compile src/main.typ fbdl.pdf

.PHONY: show
show: fbdl.pdf
	evince fbdl.pdf > /dev/null 2>&1 &
