# Dotfiles #
Dotfiles I use for GNU screen, tmux, vim and bash. Most of it is ripped from
other people. Unfortunately I forgot the original source in some cases. Notify
me if you want credits.

## Installation ##
Clone the repository

```
https://github.com/inodb/dotfiles.git
```

Go to the directory


```
cd dotfiles
```

Use the Makefile to install which dotfiles you want to use. You can look at the
available rules with:


```
less Makefile
```

Basically the dotfiles are installed by creating a line in your rc file that
sources the file in this repository. The line is only added if it is not in
there yet (empty files work as well). That way your own source file is not
cluttered up and deinstalling is as simple as removing or commenting out that
particular line. To add the provided dotfiles to your own rc files run:

```
make installrc
```

This repository also includes an installation procedure for my favorite vim
plugins i.e. minibufexpl, nerdtree, python-mode, tagbar, delimitMate and ctrlp.
Just run:

```
make installvim
```
