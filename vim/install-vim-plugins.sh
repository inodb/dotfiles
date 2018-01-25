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
if [[ ! -d vim-fugitive ]]; then
    git clone https://github.com/tpope/vim-fugitive \
        && vim -u NONE -c "helptags vim-fugitive/doc" -c q \
        && echo "vim-fugitive installed "
fi
if [[ ! -d syntastic ]]; then
   git clone --depth=1 https://github.com/vim-syntastic/syntastic.git \
        && vim -u NONE -c "helptags syntastic/doc" -c q \
        && echo "syntastic installed"
fi
if [[ ! -d vimproc.vim ]]; then
    git clone https://github.com/Shougo/vimproc.vim \
        && echo "vimproc.vim installed"
fi
if [[ ! -d tsuquyomi ]]; then
    git clone https://github.com/Quramy/tsuquyomi \
        && echo "tsuquyomi installed"
fi
if [[ ! -f ~/.vim/autoload/plug.vim ]]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
        && echo "vim-plug installed"

fi
