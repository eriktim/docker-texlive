#!/bin/bash

mkdir -p ${TEXMFLOCAL}/fonts/truetype/arialblk
cp /usr/share/fonts/truetype/msttcorefonts/Arial_Black.ttf ${TEXMFLOCAL}/fonts/truetype/arialblk/marblk16.ttf
mkdir -p ${TEXMFLOCAL}/tex/latex/arialblk
echo -e "\DeclareFontFamily{T1}{arialblk}{}%\n\DeclareFontShape{T1}{arialblk}{m}{n}{<-> marblk16t}{}%\n\usepackage[T1]{fontenc}%" > ${TEXMFLOCAL}/tex/latex/arialblk/arialblk.sty
mkdir -p ${TEXMFLOCAL}/fonts/map/pdftex
mkdir -p ${TEXMFLOCAL}/fonts/tfm/ArialBlack/
ttf2tfm ${TEXMFLOCAL}/fonts/truetype/arialblk/marblk16.ttf -T ${TEXMFLOCAL}/fonts/enc/T1-WGL4.enc ${TEXMFLOCAL}/fonts/tfm/ArialBlack/marblk16t.tfm
echo -e "marblk16t ArialBlackMT <T1-WGL4.enc <marblk16.ttf" > ${TEXMFLOCAL}/fonts/map/pdftex/arialblk.map
