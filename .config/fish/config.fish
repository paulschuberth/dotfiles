
set PATH "$PATH:/Users/schuberth/bin:/Users/schuberth/.sdkman/bin"
set EDITOR vim
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8
set -gx LANGUAGE en_US.UTF-8

fish_add_path /Users/schuberth/bin
fish_add_path /Users/schuberth/.sdkman/bin
fish_add_path /Users/schuberth/go/bin
fish_add_path /Users/schuberth/.cargo/bin
fish_add_path /Users/schuberth/Library/Python/3.9/bin
fish_add_path /Users/schuberth/.composer/vendor/bin
fish_add_path /Users/schuberth/dotfiles/cf-utils
fish_add_path /Users/schuberth/dotfiles/utils

set fish_greeting
set -x GOPATH /Users/schuberth/code
set -x GOBIN /Users/schuberth/go/bin

set -xg ALACRITTY_THEME_DARK Tomorrow-Night
set -xg ALACRITTY_THEME_LIGHT github_light_default

if type -q starship
	starship init fish | source
end

if status is-interactive
    if not set -q TMUX
#         # attempt to attach to tmux session
        tmux new-session -A -s main
    end
end

fish_add_path (brew --prefix)/opt/mysql@5.6/bin
fish_add_path (brew --prefix)/sbin

# Aliases
alias vim="nvim"
alias vi="nvim"
alias python="python3"

if test -e ~/dotfiles/fish/aliases.fish
    source ~/dotfiles/fish/aliases.fish
end

if test -e ~/dotfiles/fish/local.fish
    source ~/dotfiles/fish/local.fish
end

fish_add_path /usr/local/opt/python@3.8/bin
fish_add_path /usr/local/opt/node@16/bin

# Pack completion
source (pack completion --shell fish)

# The fuck
thefuck --alias | source

# Git
git config --global alias.clean-branches "!git branch | grep -v -e main -e master -e develop | xargs git branch -D"

# FZF
## Setup bindings
fzf_configure_bindings --variables=\cv --processes=\cp --git_status=\cs --directory=\cf --git_log=\ch --history=\cr
