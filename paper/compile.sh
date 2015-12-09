#!/bin/bash

pdflatex --shell-escape paper.tex

bibtex paper
bibtex paper

pdflatex --shell-escape paper.tex
pdflatex --shell-escape paper.tex

rm -f *.dvi *.aux *.log *.blg *.out *.backup *.bbl paper.ps figs/*.log figs/*.aux sections/*.log sections/*.aux sections/*.backup *.tmp *~
