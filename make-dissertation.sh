#!/bin/bash
pdflatex dissertation;
for auxfile in chapter*.aux
do
    bibtex `basename $auxfile .aux`
done

for bblfile in chapter*.bbl
do
	cat $bblfile | sed 's/thebibliography/references/' > tmp
	mv tmp $bblfile
done

bibtex dissertation;
pdflatex dissertation;
pdflatex dissertation;
pdflatex dissertation;
