# From source code to packaging: open source software distribution review and tips

This repository contains the files to build the PDF of my manual

## Build instructions

Install the necessary packages:

### Fedora:
```
sudo dnf -y install texlive-scheme-basic ghostscript-tools-dvipdf 'tex(tabls.sty)' 'tex(multirow.sty)' \
'tex(fancybox.sty)' 'tex(minifp.sty)' 'tex(keystroke.sty)' 'tex(leystroke.sty)' 'tex(ulem.sty)' \
'tex(hypernat.sty)' 'tex(lettrine.sty)'  
```

### Build the pdf:

```
./build-open
```
