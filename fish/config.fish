
change_background &> /dev/null

set PATH "$PATH:/Users/schuberth/bin:/Users/schuberth/.sdkman/bin"
set EDITOR vim

fish_add_path /Users/schuberth/bin
fish_add_path /Users/schuberth/.sdkman/bin
fish_add_path /Users/schuberth/go/bin
fish_add_path /Users/schuberth/.cargo/bin
fish_add_path /Users/schuberth/Library/Python/3.9/bin
fish_add_path /Users/schuberth/.composer/vendor/bin

set fish_greeting
set GOPATH -x /Users/schuberth/code
set GOBIN -x /Users/schuberth/go/bin

if type -q starship
	starship init fish | source
end

set NVM_DIR "$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if status is-interactive
    if not set -q TMUX
        # attempt to attach to tmux session
        tmux attach -t main || tmux new -s main
    end
end

fish_add_path /usr/local/opt/mysql@5.6/bin
fish_add_path /usr/local/sbin

# Aliases
alias vim="nvim"
alias vi="nvim"
alias python="python3"
alias branch="/Users/schuberth/code/audi/acpp-branch-automation/branch.py"

if test -e ~/dotfiles/fish/aliases.fish
    source ~/dotfiles/fish/aliases.fish
end

if test -e ~/dotfiles/fish/local.fish
    source ~/dotfiles/fish/local.fish
end

