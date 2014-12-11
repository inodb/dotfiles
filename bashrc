# vi:syntax=sh
# Append commands to history immediately (for screen)

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Append history
shopt -s histappend                                  
if [ -n "${PROMPT_COMMAND:+1}" ]                     
then                                                 
    PROMPT_COMMAND="${PROMPT_COMMAND};history -a"    
else                                                 
    PROMPT_COMMAND="history -a"                      
fi                                                   
# /Eternal bash history.
# ---------------------

if [ -t 0 ]; then   # only run if stdin is a terminal ]
    stty -ixon # allow incremental search
    # bash
    # No ttyctl, so we need to save and then restore terminal settings
    vim()
    {
        local STTYOPTS="$(stty --save)"
        stty stop '' -ixoff
        command vim -u ~/.vimrc "$@"
        stty "$STTYOPTS"
    }
    alias vi='vim'
    set -o vi
    bind -x '"\C-k": ls'
    bind -x '"\C-f": fg %'
    PS1='\[\e[32m\]\u @ \h \[\e[33m\]\w \[\e[0m\]'
fi

# User specific aliases and functions
alias cgrep="grep --color=always"
alias cless="less -R"
alias ls="ls --color=auto"
alias lh='ls -lh'
alias ll='ls -l'
alias dh='du -h'
function viprog() { vi `which $@` ;}

# Extended globbing
shopt -s extglob

# xclip
# Screen X for xclip
# Login with scrn, which echoes DISPLAY to ~/.xdisplay
# DISPLAY is set to the contents of ~/.xdisplay before every run
alias xc="xclip -sel clip"
alias xco="xclip -o -sel clip"
function scrn() { echo $DISPLAY > ~/.xdisplay; screen -DR ;}
function xpathc() { OUT=`readlink -f $@`; echo $OUT | xclip -sel clip; echo Xcopied $OUT to primary selection ;}

# Stop prompt for git password
unset SSH_ASKPASS
