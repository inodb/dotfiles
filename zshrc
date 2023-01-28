export PATH="$HOME/bin:$PATH"
# vi:syntax=zsh
# Append commands to history immediately (for screen)

# zsh histroy settings
export HISTSIZE=999999999
export HISTTIMEFORMAT="[%F %T] "
# Appends every command to the history file once it is executed
setopt inc_append_history
# Reloads the history whenever you use it
setopt share_history
# for some reason fzf does not get latest history, so run history after each
# cmd instead
#update_history() {
#    fc -R $HISTFILE
#}

# User specific aliases and functions
alias cgrep="grep --color=always"
alias cless="less -R"
alias ls="ls --color=auto"
alias lh='ls -lh'
alias ll='ls -l'
alias llt='ls -lt'
alias llth='ls -lth'
alias dh='du -h'
# Mac specific aliases
if [[ "$(uname)" = "Darwin" ]]; then
    alias ls='gls --color'
    alias sort='gsort'
fi
function viprog() { vi `which $@` ;}

setopt extended_glob

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export TERM="xterm"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh

export YVM_DIR=/Users/debruiji/.yvm
[ -r $YVM_DIR/yvm.sh ] && . $YVM_DIR/yvm.sh
source ~/git/zsh-git-prompt/zshrc.sh
GIT_PROMPT_EXECUTABLE="shell"
NEWLINE=$'\n'
PROMPT="%{$fg[white]%}%n%{$reset_color%}@%{$fg[white]%}%m %{$fg[yellow]%}%~ %{$reset_color%}$(git_super_status)${NEWLINE}%D{%L:%M} $ "
