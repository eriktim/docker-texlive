FROM debian:jessie

MAINTAINER Erik Timmers <e.timmers@gmail.com>

RUN echo "deb http://http.debian.net/debian/ jessie main contrib" > /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y perl-modules ttf-mscorefonts-installer unzip wget xzdec && \
    rm -rf /var/lib/apt/lists/*

COPY texlive.profile /texlive.profile

# source: https://www.tug.org/texlive/acquire-netinstall.html
RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
    tar -xvf install-tl-unx.tar.gz -C /opt/ && \
    rm install-tl-unx.tar.gz && \
    ./opt/install-tl-2016*/install-tl --profile=/texlive.profile && \
    rm -rf /opt/install-tl-2016*

ENV PATH="/usr/local/texlive/2016/bin/x86_64-linux:${PATH}"
ENV TEXMFLOCAL="/usr/local/texlive/texmf-local"

RUN tlmgr install arev bera colortbl etoolbox fancyhdr pgf sectsty textpos titlesec titling ulem

# source: http://www.verbeia.com/tex/
RUN wget -N http://www.verbeia.com/tex/fontsupport/arial.zip && \
    unzip arial.zip && \
    rm -r __MAC* && \
    mkdir -p ${TEXMFLOCAL}/fonts/truetype/arial && \
    cp /usr/share/fonts/truetype/msttcorefonts/Arial.ttf ${TEXMFLOCAL}/fonts/truetype/arial/marr16.ttf && \
    cp /usr/share/fonts/truetype/msttcorefonts/Arial_Bold.ttf ${TEXMFLOCAL}/fonts/truetype/arial/marb16.ttf && \
    cp /usr/share/fonts/truetype/msttcorefonts/Arial_Italic.ttf ${TEXMFLOCAL}/fonts/truetype/arial/marri16.ttf && \
    cp /usr/share/fonts/truetype/msttcorefonts/Arial_Bold_Italic.ttf ${TEXMFLOCAL}/fonts/truetype/arial/marbi16.ttf && \
    mkdir -p ${TEXMFLOCAL}/tex/latex/arialmt && \
    cp -rf arial/tex/* ${TEXMFLOCAL}/tex/latex/arialmt && \
    mkdir -p ${TEXMFLOCAL}/fonts/tfm && \
    cp -rf arial/tfm/* ${TEXMFLOCAL}/fonts/tfm && \
    mkdir -p ${TEXMFLOCAL}/fonts/vf && \
    cp -rf arial/vf/* ${TEXMFLOCAL}/fonts/vf && \
    mkdir -p ${TEXMFLOCAL}/fonts/enc && \
    cp -rf arial/*.enc ${TEXMFLOCAL}/fonts/enc && \
    mkdir -p ${TEXMFLOCAL}/fonts/map/pdftex && \
    cp -rf arial/arial.map ${TEXMFLOCAL}/fonts/map/pdftex && \
    rm -rf arial/ && \
    rm arial.zip && \
    mktexlsr && \
    updmap-sys -enable Map=arial.map

WORKDIR /data

VOLUME ["/data"]
