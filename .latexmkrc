#!/usr/bin/env perl

# latexmk configuration for namecard.sty
# Supports: upLaTeX, LuaLaTeX, XeLaTeX

# Default: Use LuaLaTeX (recommended for modern systems)
# Change $pdf_mode to switch engines:
#   1 = pdflatex (not recommended for Japanese)
#   3 = dvipdfmx (for upLaTeX)
#   4 = lualatex
#   5 = xelatex

$pdf_mode = 4;  # LuaLaTeX

# LuaLaTeX settings
$lualatex = 'lualatex -synctex=1 -interaction=nonstopmode -file-line-error %O %S';

# XeLaTeX settings
$xelatex = 'xelatex -synctex=1 -interaction=nonstopmode -file-line-error %O %S';

# upLaTeX settings (if you prefer upLaTeX, set $pdf_mode = 3)
$latex = 'uplatex -synctex=1 -interaction=nonstopmode -file-line-error %O %S';
$dvipdf = 'dvipdfmx %O -o %D %S';

# Output directory
$out_dir = './';

# Clean up extensions
$clean_ext = 'synctex.gz synctex.gz(busy) run.xml tex.bak bbl bcf fdb_latexmk run tdo %R-blx.bib';

# Prevent latexmk from removing PDF after "latexmk -c"
$pdf_previewer = 'open -a Preview %S';  # macOS
# $pdf_previewer = 'evince %S';         # Linux
# $pdf_previewer = 'start %S';          # Windows
