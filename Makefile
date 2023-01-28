SHELL := /bin/bash

BASH_GIT_PROMPT_DIR ?= ~/git/bash-git-prompt
ZSH_GIT_PROMPT_DIR ?= ~/git/zsh-git-prompt

installrc: _bashrc _vimrc _tmuxconf _screenrc _installrc

_bashrc: bashrc
	if [[ -f ~/.bashrc ]] && $$(grep -q "source $(shell pwd)/bashrc" ~/.bashrc); then \
		echo "bashrc already installed"; \
	else \
		echo "source $(shell pwd)/bashrc" >> ~/.bashrc; \
		echo "bashrc installed"; \
	fi

_zshrc: zshrc
	if [[ -f ~/.zshrc ]] && $$(grep -q "source $(shell pwd)/zshrc" ~/.zshrc); then \
		echo "zshrc already installed"; \
	else \
		echo "source $(shell pwd)/zshrc" >> ~/.zshrc; \
		echo "zshrc installed"; \
	fi

_vimrc: vimrc
	if [[ -f ~/.vimrc ]] && $$(grep -q "source $(shell pwd)/vimrc" ~/.vimrc); then \
		echo "vimrc already installed"; \
	else \
		echo "source $(shell pwd)/vimrc" >> ~/.vimrc; \
		echo "vimrc installed"; \
	fi

_tmuxconf: tmux.conf
	if [[ -f ~/.tmux.conf ]] && $$(grep -q "source $(shell pwd)/tmux.conf" ~/.tmux.conf); then \
		echo "tmux.conf already installed"; \
	else \
		echo "source $(shell pwd)/tmux.conf" >> ~/.tmux.conf; \
		echo "tmux.conf installed"; \
	fi

_screenrc: screenrc
	if [[ -f ~/.screenrc ]] && $$(grep -q "source $(shell pwd)/screenrc" ~/.screenrc); then \
		echo "screenrc already installed"; \
	else \
		echo "source $(shell pwd)/screenrc" >> ~/.screenrc; \
		echo "screenrc installed"; \
	fi

installvim: vim/install-vim-plugins.sh
	./vim/install-vim-plugins.sh

installbashgitprompt:
	if [[ -f ~/.bashrc ]] && $$(grep -q "source $(BASH_GIT_PROMPT_DIR)/gitprompt.sh" ~/.bashrc); then \
		echo "bash-git-prompt already installed"; \
	else \
		git clone https://github.com/magicmonty/bash-git-prompt $(BASH_GIT_PROMPT_DIR); \
		echo "source $(BASH_GIT_PROMPT_DIR)/gitprompt.sh" >> ~/.bashrc; \
		echo "bash-git-prompt installed"; \
	fi

installzshgitprompt:
	if [[ -f ~/.zshrc ]] && $$(grep -q "source $(ZSH_GIT_PROMPT_DIR)/zshrc.sh" ~/.zshrc); then \
		echo "zsh-git-prompt already installed"; \
	else \
		git clone https://github.com/zsh-git-prompt/zsh-git-prompt $(ZSH_GIT_PROMPT_DIR); \
		echo "source $(ZSH_GIT_PROMPT_DIR)/zshrc.sh" >> ~/.zshrc; \
		echo "zsh-git-prompt installed"; \
	fi

installgitconfig:
	if [[ -f ~/.gitconfig ]]; then \
		echo "~/.gitconfig already installed"; \
	else \
		cp gitconfig ~/.gitconfig; \
		echo "gitconfig installed to ~/.gitconfig"; \
	fi

.PHONY: installrc installvim installbashgitprompt installzshgitprompt _bashrc _vimrc _tmux.conf _screenrc _zshrc
