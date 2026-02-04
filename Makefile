# Makefile for namecard.sty
#
# Usage:
#   make              Build PDF using LuaLaTeX (default)
#   make lualatex     Build PDF using LuaLaTeX
#   make uplatex      Build PDF using upLaTeX
#   make all          Build all variants
#   make clean        Remove intermediate files
#   make distclean    Remove all generated files including PDF

SAMPLE = sample
STY = namecard.sty

.PHONY: default lualatex uplatex all clean distclean

# Default target: LuaLaTeX
default: lualatex

# LuaLaTeX (recommended)
lualatex: $(SAMPLE).tex $(STY)
	latexmk -lualatex $(SAMPLE).tex

# upLaTeX + dvipdfmx
uplatex: $(SAMPLE).tex $(STY)
	latexmk -pdfdvi -latex='uplatex -synctex=1 -interaction=nonstopmode' $(SAMPLE).tex

# Build all variants
all: lualatex uplatex

# Clean intermediate files
clean:
	latexmk -c
	rm -f *.aux *.log *.dvi *.synctex.gz *.fls *.fdb_latexmk *.xdv

# Clean all generated files
distclean: clean
	rm -f $(SAMPLE).pdf
	