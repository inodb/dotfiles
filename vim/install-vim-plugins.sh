#!/bin/bash
# pathogen
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim \
    https://tpo.pe/pathogen.vim && \
    echo "pathogen installed"

cd ~/.vim/bundle
if [[ ! -d minibufexpl.vim ]]; then
    git clone https://github.com/fholgado/minibufexpl.vim \
        && echo "minibufexpl.vim installed"
fi
if [[ ! -d nerdtree ]]; then
    git clone https://github.com/scrooloose/nerdtree \
        && echo "nerdtree installed"
fi
if [[ ! -d python-mode ]]; then
    git clone https://github.com/klen/python-mode \
        && echo "python-mode installed"
fi
if [[ ! -d tagbar ]]; then
    git clone https://github.com/majutsushi/tagbar \
        && echo "tagbar installed"
fi
if [[ ! -d delimitMate ]]; then
    git clone https://github.com/Raimondi/delimitMate \
        && echo "delimitMate installed"
fi
if [[ ! -d ctrlp.vim ]]; then
    git clone https://github.com/kien/ctrlp.vim \
        && echo "ctrlp.vim installed"
fi
