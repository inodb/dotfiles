install:
	cat $(shell readlink -f bashrc) >> ~/.bashrc
	ln -s $(shell readlink -f screenrc) ~/.screenrc
	ln -s $(shell readlink -f vimrc) ~/.vimrc

vim:
	./vim/install-vim-plugins.sh
