#!/bin/bash

pdflatex --shell-escape main.tex

bibtex paper
bibtex paper

pdflatex --shell-escape main.tex
pdflatex --shell-escape main.tex

rm -f *.dvi *.aux *.log *.blg *.out *.backup *.bbl main.ps figs/*.log figs/*.aux sections/*.log sections/*.aux sections/*.backup *.tmp *~
