# vi:syntax=sh
# Append commands to history immediately (for screen)
shopt -s histappend                                  
HISTSIZE=10000000
if [ -n "${PROMPT_COMMAND:+1}" ]                     
then                                                 
    PROMPT_COMMAND="${PROMPT_COMMAND};history -a"    
else                                                 
    PROMPT_COMMAND="history -a"                      
fi                                                   

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
alias x2c="xclip -selection clipboard"
alias x2p="xclip -selection primary"
function scrn() { echo $DISPLAY > ~/.xdisplay; screen -DR ;}
function xpath2p() { OUT=`readlink -f $@`; echo $OUT | xclip; echo Xcopied $OUT to primary selection ;}

# Stop prompt for git password
unset SSH_ASKPASS
