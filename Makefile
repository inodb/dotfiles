install:
	ln -s $(readlink -f bashrc) ~/.bashrc
	ln -s $(readlink -f screenrc) ~/.screenrc
	ln -s $(readlink -f vimrc) ~/.vimrc
	cd vim && ./vim/install-vim-plugins.sh
