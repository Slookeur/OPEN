# From source code to packaging: open source software distribution review and tips

![License][license]

## Build instructions

### Install the necessary packages:

#### Fedora:

```
sudo dnf -y install texlive-scheme-basic ghostscript-tools-dvipdf 'tex(tabls.sty)' \
                    'tex(multirow.sty)' 'tex(fancybox.sty)'  'tex(minifp.sty)'  \
                    'tex(keystroke.sty)' 'tex(ulem.sty)' 'tex(hypernat.sty)' 'tex(lettrine.sty)'  
```

#### Debian:

```
sudo apt install texlive texlive-latex-recommended texlive-plain-generic texlive-latex-extra
```

### Build the pdf:

```
./build-open
o
```

[license]:https://img.shields.io/badge/License-CC_BY_4.0-blue
