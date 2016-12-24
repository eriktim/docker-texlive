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

COPY install-font-arial.sh /install-font-arial.sh
COPY install-font-arial-black.sh /install-font-arial-black.sh
COPY install-font-trebuchet.sh /install-font-trebuchet.sh

# source: http://www.verbeia.com/tex/
RUN ./install-font-arial.sh && \
    ./install-font-arial-black.sh && \
    ./install-font-trebuchet.sh && \
    rm /install-font-arial.sh && \
    rm /install-font-trebuchet.sh && \
    rm /install-font-arial-black.sh && \
    mktexlsr && \
    updmap-sys -enable Map=arial.map && \
    updmap-sys -enable Map=arialblk.map && \
    updmap-sys -enable Map=trebuchet.map

WORKDIR /texlive

VOLUME ["/texlive"]
