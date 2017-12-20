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
    PROMPT_COMMAND="history -a; history -c; history -r; ${PROMPT_COMMAND}"
else                                                 
    PROMPT_COMMAND="history -a; history -c; history -r;"
fi                                                   

# /Eternal bash history.
# ---------------------

if [ -t 0 ]; then   # only run if stdin is a terminal ]
    stty -ixon # allow incremental search
    # bash
    # No ttyctl, so we need to save and then restore terminal settings
    vim()
    {
        if [[ "$(uname)" = "Darwin" ]]; then
            local STTYOPTS="$(stty -g)"
        else
            local STTYOPTS="$(stty --save)"
        fi
        stty stop '' -ixoff
        command vim -u ~/.vimrc "$@"
        stty "$STTYOPTS"
    }
    alias vi='vim'
    set -o vi
    bind -x '"\C-k": ls'
    bind -x '"\C-f": fg %'
    PS1='\[\e[32m\]\u @ \h \[\e[33m\]\w \[\e[0m\]'
    # bash-git-prompt features (needs to be installed)
    GIT_PROMPT_START=$PS1
    GIT_PROMPT_THEME=Chmike
    GIT_PROMPT_FETCH_REMOTE_STATUS=0
    GIT_PROMPT_SHOW_UNTRACKED_FILES=no
fi

# User specific aliases and functions
alias cgrep="grep --color=always"
alias cless="less -R"
alias ls="ls --color=auto"
alias lh='ls -lh'
alias ll='ls -l'
alias llt='ls -lt'
alias llth='ls -lth'
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
function xpathc() { OUT=`readlink -f $@`; echo $OUT | xclip -sel clip; echo Xcopied $OUT to clipboard;}

# Stop prompt for git password
unset SSH_ASKPASS

# wait for any process, not just child
# http://stackoverflow.com/questions/1058047
anywait() {
    for pid in "$@"; do
        while kill -0 "$pid"; do
            sleep 0.5
        done
    done
}

# finds files in directory ($1) and greps for ($2)
grep_files_in_dir() { find $1 -type f | xargs grep --color=always $2; }

# show access rights over entire path $1
# https://gist.github.com/inodb/8470322
rightpath() {
    path=""
    for d in `readlink -f $1 | tr / " "`
        do
            path="$path/$d"
            stat -c "%A %a %U %G %n" $path
        done | column -t
}

count_headers_in_file() {
    head -1 $1 | py -l '[list(enumerate(r.split())) for r in l]'
}

alias urlencode="python -c 'import sys, urllib; print urllib.quote(sys.stdin.read())'"
alias vjson="python -m json.tool | pygmentize -g"
alias rlf="readlink -f"

# http://stackoverflow.com/questions/21416189
replace_key_value_tsv_in_tsv() {
    awk -v FS='\t' -v OFS='\t' '
        NR==FNR {dict[$1]=$2; next}
        {for (i=1; i<=NF; i++) if ($i in dict) $i=dict[$i]; print}
    ' $1 $2
}

alias tawk="awk -vFS='\t' -vOFS='\t'"

# yaml2json
yaml2json() {
    cat $1 | python -c 'import sys, yaml, json; json.dump(yaml.load(sys.stdin), sys.stdout, indent=4)'
}

# ls-files for git
lsf() {
    git ls-files "*$1*"
}

# Mac specific aliases
if [[ "$(uname)" = "Darwin" ]]; then
    alias ls='gls --color'
    alias sort='gsort'
fi

[ -f $HOME/.fzf.bash ] && source $HOME/.fzf.bash
[ -f $HOME/git/bash-git-prompt/gitprompt.sh ] && source $HOME/git/bash-git-prompt/gitprompt.sh
