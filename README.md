# Docker TeXLive

## Usage

    docker run -it --rm -v $(pwd):/data trenneman/texlive

or

    docker run -v $(pwd):/texlive trenneman/texlive pdflatex some-doc.tex

## Fonts

#### Arial

    \usepackage{arialmt}

#### Trebuchet

    \usepackage{trebuchet}
