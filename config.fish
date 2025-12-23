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

# hack for merged history across shells
# https://github.com/fish-shell/fish-shell/issues/825#issuecomment-440286038
function up-or-search -d "Depending on cursor position and current mode, either search backward or move up one line"
    # If we are already in search mode, continue
    if commandline --search-mode
        commandline -f history-search-backward
        return
    end

    # If we are navigating the pager, then up always navigates
    if commandline --paging-mode
        commandline -f up-line
        return
    end

    # We are not already in search mode.
    # If we are on the top line, start search mode,
    # otherwise move up
    set lineno (commandline -L)

    switch $lineno
        case 1
            commandline -f history-search-backward
            history merge # <-- ADDED THIS

        case '*'
            commandline -f up-line
    end
end

# cBioPortal work functions
function cbio-frontend-pr -d "Checkout and setup a cBioPortal frontend PR"
    if test (count $argv) -ne 1
        echo "Usage: cbio-frontend-pr <pr_number>"
        return 1
    end

    set pr_number $argv[1]
    set worktree_path ~/git/cbioportal-frontend-prs/pr-$pr_number
    set port 3$pr_number

    # Clean up any existing worktree for this PR
    git -C ~/git/cbioportal-frontend worktree remove $worktree_path 2>/dev/null; or true
    git -C ~/git/cbioportal-frontend worktree prune

    # Create worktree and checkout PR
    git -C ~/git/cbioportal-frontend worktree add $worktree_path
    and cd $worktree_path
    and gh pr checkout $pr_number -R cbioportal/cbioportal-frontend
    and echo "Setting up frontend environment..."
    and nvm use v15.2.1
    and set -x BRANCH_ENV master
    and yarn install --frozen-lockfile
    and yarn run buildDLL:dev
    and yarn run buildModules
    and echo "Starting dev server on port $port..."
    and env PORT=$port yarn run startSSL
end
