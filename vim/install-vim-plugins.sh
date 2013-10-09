#!/bin/bash
# pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle; \
curl -Sso ~/.vim/autoload/pathogen.vim \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

cd ~/.vim/bundle
git clone https://github.com/fholgado/minibufexpl.vim
git clone https://github.com/scrooloose/nerdtree
git clone https://github.com/klen/python-mode
git clone https://github.com/majutsushi/tagbar
git clone https://github.com/Raimondi/delimitMate
