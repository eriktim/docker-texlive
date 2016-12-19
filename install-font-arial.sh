#!/bin/sh

wget -N http://www.verbeia.com/tex/fontsupport/arial.zip
unzip arial.zip
rm -r __MAC*
mkdir -p ${TEXMFLOCAL}/fonts/truetype/arial
cp /usr/share/fonts/truetype/msttcorefonts/Arial.ttf ${TEXMFLOCAL}/fonts/truetype/arial/marr16.ttf
cp /usr/share/fonts/truetype/msttcorefonts/Arial_Bold.ttf ${TEXMFLOCAL}/fonts/truetype/arial/marb16.ttf
cp /usr/share/fonts/truetype/msttcorefonts/Arial_Italic.ttf ${TEXMFLOCAL}/fonts/truetype/arial/marri16.ttf
cp /usr/share/fonts/truetype/msttcorefonts/Arial_Bold_Italic.ttf ${TEXMFLOCAL}/fonts/truetype/arial/marbi16.ttf
mkdir -p ${TEXMFLOCAL}/tex/latex/arialmt
cp -rf arial/tex/* ${TEXMFLOCAL}/tex/latex/arialmt
mkdir -p ${TEXMFLOCAL}/fonts/tfm
cp -rf arial/tfm/* ${TEXMFLOCAL}/fonts/tfm
mkdir -p ${TEXMFLOCAL}/fonts/vf
cp -rf arial/vf/* ${TEXMFLOCAL}/fonts/vf
mkdir -p ${TEXMFLOCAL}/fonts/enc
cp -rf arial/*.enc ${TEXMFLOCAL}/fonts/enc
mkdir -p ${TEXMFLOCAL}/fonts/map/pdftex
cp -rf arial/arial.map ${TEXMFLOCAL}/fonts/map/pdftex
rm -rf arial/
rm arial.zip