NAME=specification

#all: ${NAME}.ps ${NAME}.pdf
all: ${NAME}.pdf

clean:
	rm -f images/*
	rm -f ${NAME}.log
	rm -f ${NAME}.lof
	rm -f ${NAME}.lot
	rm -f ${NAME}.toc
	rm -f ${NAME}.ps
	rm -f ${NAME}.out
	rm -f ${NAME}-blx.bib
	rm -f texput.log
	rm -f *.blg *.aux *.dvi *.bbl
	rm -f src/*.aux
	rm -rf _minted-thesis/

#pdf: ${NAME}.pdf

#${NAME}.pdf: ${NAME}.dvi
#	dvipdf ${NAME}.dvi

show: ${NAME}.pdf
	evince ${NAME}.pdf > /dev/null 2>&1 & disown

images:
	mkdir -p images

images/done: images images.src/*
	make -p images
	$(MAKE) -Cimages.src
	touch images/done
	
#${NAME}.ps: ${NAME}.dvi
#	dvips -Ppdf -o ${NAME}.ps ${NAME}.dvi

#${NAME}.pdf: images/done src/*.tex src/${NAME}.bib
${NAME}.pdf: images/done src/*.tex
	pdflatex -shell-escape src/${NAME}.tex
	pdflatex -shell-escape src/${NAME}.tex
#	bibtex ${NAME}
#	pdflatex -shell-escape src/${NAME}.tex
#	pdflatex -shell-escape src/${NAME}.tex
