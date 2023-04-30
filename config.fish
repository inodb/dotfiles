eval "$(/opt/homebrew/bin/brew shellenv)"

# Commands to run in interactive sessions can go here
starship init fish | source

# plugin-z script path
set -g Z_SCRIPT_PATH /opt/homebrew/etc/profile.d/z.sh

alias ls='lsd'
