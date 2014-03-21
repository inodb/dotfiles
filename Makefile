SHELL := /bin/bash

installrc: _bashrc _vimrc _tmuxconf _screenrc

_bashrc: bashrc
	if [[ -f ~/.bashrc ]] && $$(grep -q "source $(shell readlink -f bashrc)" ~/.bashrc); then \
		echo "bashrc already installed"; \
	else \
		echo "source $(shell readlink -f bashrc)" >> ~/.bashrc; \
		echo "bashrc installed"; \
	fi

_vimrc: vimrc
	if [[ -f ~/.vimrc ]] && $$(grep -q "source $(shell readlink -f vimrc)" ~/.vimrc); then \
		echo "vimrc already installed"; \
	else \
		echo "source $(shell readlink -f vimrc)" >> ~/.vimrc; \
		echo "vimrc installed"; \
	fi

_tmuxconf: tmux.conf
	if [[ -f ~/.tmux.conf ]] && $$(grep -q "source $(shell readlink -f tmux.conf)" ~/.tmux.conf); then \
		echo "tmux.conf already installed"; \
	else \
		echo "source $(shell readlink -f tmux.conf)" >> ~/.tmux.conf; \
		echo "tmux.conf installed"; \
	fi

_screenrc: screenrc
	if [[ -f ~/.screenrc ]] && $$(grep -q "source $(shell readlink -f screenrc)" ~/.screenrc); then \
		echo "screenrc already installed"; \
	else \
		echo "source $(shell readlink -f screenrc)" >> ~/.screenrc; \
		echo "screenrc installed"; \
	fi

installvim: vim/install-vim-plugins.sh
	./vim/install-vim-plugins.sh

.PHONY: installrc installvim _bashrc _vimrc _tmux.conf _screenrc
