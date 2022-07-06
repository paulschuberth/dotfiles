
set PATH "$PATH:/Users/schuberth/bin:/Users/schuberth/.sdkman/bin"
set EDITOR vim

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

set -xg ALACRITTY_THEME_DARK Base16-Default-Dark
set -xg ALACRITTY_THEME_LIGHT Terminal-app-Basic

if type -q starship
	starship init fish | source
end

if status is-interactive
    if not set -q TMUX
        # attempt to attach to tmux session
        tmux attach -t main || tmux new -s main
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

fish_add_path /opt/homebrew/opt/python@3.8/bin
fish_add_path /opt/homebrew/opt/node@16/bin

# Pack completion
source (pack completion --shell fish)

