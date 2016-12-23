# Docker TeXLive

## Usage

    docker run -it --rm -v $(pwd):/data trenneman/texlive

or

    echo -e '#!/bin/bash\n\nif [ ! -f "$1" ]; then\n  echo "Run as: pdflatex <doc.tex>"\n  exit 1\nfi\n\ndocker run --rm --user="$(id -u):$(id -g)" --network=none -v $(pwd):/texlive trenneman/texlive pdflatex $1' | sudo tee /usr/local/bin/pdflatex
    sudo chmod +x /usr/local/bin/pdflatex

## Fonts

#### Arial

    \usepackage{arialmt}

#### Trebuchet

    \usepackage{trebuchet}
