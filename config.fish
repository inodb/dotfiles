if test -e /opt/homebrew/bin/brew
    eval "$(/opt/homebrew/bin/brew shellenv)"

    if test -e "$(brew --prefix)/share/google-cloud-sdk/path.fish.inc"
        source "$(brew --prefix)/share/google-cloud-sdk/path.fish.inc"
    end
end

# vim bindings
fish_vi_key_bindings

# Commands to run in interactive sessions can go here
starship init fish | source

# plugin-z script path
set -g Z_SCRIPT_PATH /opt/homebrew/etc/profile.d/z.sh

alias ls='lsd'
