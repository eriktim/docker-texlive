FROM debian:jessie

MAINTAINER Erik Timmers <e.timmers@gmail.com>

RUN apt-get update && \
    apt-get install -y perl-modules unzip wget xzdec && \
    rm -rf /var/lib/apt/lists/*

COPY texlive.profile /texlive.profile

# source: https://www.tug.org/texlive/acquire-netinstall.html
RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz && \
    tar -xvf install-tl-unx.tar.gz -C /opt/ && \
    rm install-tl-unx.tar.gz && \
    ./opt/install-tl-2016*/install-tl --profile=/texlive.profile && \
    rm -rf /opt/install-tl-2016*

ENV PATH="/usr/local/texlive/2016/bin/x86_64-linux:${PATH}"

RUN tlmgr init-usertree && \
    tlmgr --usermode install arev bera colortbl etoolbox fancyhdr pgf sectsty textpos titlesec titling ulem

# source: http://www.verbeia.com/tex/
# bug -- see https://bugs.launchpad.net/ubuntu/+source/aptitude/+bug/1543280
# later add 'ttf-mscorefonts-installer' to apt-get install
RUN apt-get update && \
    apt-get install -y cabextract xfonts-utils && \
    rm -rf /var/lib/apt/lists/* && \
    wget http://ftp.nl.debian.org/debian/pool/contrib/m/msttcorefonts/ttf-mscorefonts-installer_3.6_all.deb && \
    dpkg -i ttf-mscorefonts-installer_3.6_all.deb && \
    rm ttf-mscorefonts-installer_3.6_all.deb

RUN wget -N http://www.verbeia.com/tex/fontsupport/trebuchet.zip && \
    unzip trebuchet.zip && \
    rm -r __MAC* && \
    mkdir -p ~/texmf/fonts && \
    mkdir -p ~/texmf/fonts/truetype/ms/trebuchet && \
    cp /usr/share/fonts/truetype/msttcorefonts/Trebuchet_MS.ttf ~/texmf/fonts/truetype/ms/trebuchet/mtbr16.ttf && \
    cp /usr/share/fonts/truetype/msttcorefonts/Trebuchet_MS_Bold.ttf ~/texmf/fonts/truetype/ms/trebuchet/mtbb16.ttf && \
    cp /usr/share/fonts/truetype/msttcorefonts/Trebuchet_MS_Italic.ttf ~/texmf/fonts/truetype/ms/trebuchet/mtbri16.ttf && \
    cp /usr/share/fonts/truetype/msttcorefonts/Trebuchet_MS_Bold_Italic.ttf ~/texmf/fonts/truetype/ms/trebuchet/mtbbi16.ttf && \
    mkdir -p ~/texmf/tex/latex && \
    cp -rf trebuchet/tex/* ~/texmf/tex/latex && \
    mkdir -p ~/texmf/fonts/tfm && \
    cp -rf trebuchet/tfm/* ~/texmf/fonts/tfm && \
    mkdir -p ~/texmf/fonts/vf && \
    cp -rf trebuchet/vf/* ~/texmf/fonts/vf && \
    mkdir -p ~/texmf/fonts/enc && \
    cp -rf trebuchet/*.enc ~/texmf/fonts/enc && \
    mkdir -p ~/texmf/fonts/map/pdftex && \
    cp -rf trebuchet/trebuchet.map ~/texmf/fonts/map/pdftex && \
    updmap-sys -enable Map=trebuchet.map && \
    rm -rf trebuchet/ && \
    rm trebuchet.zip

WORKDIR /data

VOLUME ["/data"]