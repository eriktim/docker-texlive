#!/bin/sh

wget -N http://www.verbeia.com/tex/fontsupport/trebuchet.zip 
unzip trebuchet.zip 
rm -r __MAC* 
mkdir -p ${TEXMFLOCAL}/fonts/truetype/trebuchet
cp /usr/share/fonts/truetype/msttcorefonts/Trebuchet_MS.ttf ${TEXMFLOCAL}/fonts/truetype/trebuchet/mtbr16.ttf
cp /usr/share/fonts/truetype/msttcorefonts/Trebuchet_MS_Bold.ttf ${TEXMFLOCAL}/fonts/truetype/trebuchet/mtbb16.ttf
cp /usr/share/fonts/truetype/msttcorefonts/Trebuchet_MS_Italic.ttf ${TEXMFLOCAL}/fonts/truetype/trebuchet/mtbri16.ttf
cp /usr/share/fonts/truetype/msttcorefonts/Trebuchet_MS_Bold_Italic.ttf ${TEXMFLOCAL}/fonts/truetype/trebuchet/mtbbi16.ttf
mkdir -p ${TEXMFLOCAL}/tex/latex 
cp -rf trebuchet/tex/* ${TEXMFLOCAL}/tex/latex 
mkdir -p ${TEXMFLOCAL}/fonts/tfm 
cp -rf trebuchet/tfm/* ${TEXMFLOCAL}/fonts/tfm 
mkdir -p ${TEXMFLOCAL}/fonts/vf 
cp -rf trebuchet/vf/* ${TEXMFLOCAL}/fonts/vf 
mkdir -p ${TEXMFLOCAL}/fonts/enc 
cp -rf trebuchet/*.enc ${TEXMFLOCAL}/fonts/enc 
mkdir -p ${TEXMFLOCAL}/fonts/map/pdftex 
cp -rf trebuchet/trebuchet.map ${TEXMFLOCAL}/fonts/map/pdftex
rm -rf trebuchet/ 
rm trebuchet.zip