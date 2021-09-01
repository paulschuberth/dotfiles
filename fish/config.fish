
set PATH "$PATH:/Users/schuberth/bin:/Users/schuberth/.sdkman/bin"
set EDITOR vim

fish_add_path /Users/schuberth/bin
fish_add_path /Users/schuberth/.sdkman/bin
fish_add_path /Users/schuberth/.cargo/bin
fish_add_path /Users/schuberth/Library/Python/3.9/bin
fish_add_path /Users/schuberth/.composer/vendor/bin

set fish_greeting

starship init fish | source

set NVM_DIR "$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

ssh-add -K ~/.ssh/devstack &> /dev/null
ssh-add -K ~/.ssh/github &> /dev/null
ssh-add -K ~/.ssh/github2 &> /dev/null

if status is-interactive
    if not set -q TMUX
        # attempt to attach to tmux session
        tmux attach || tmux
    end
end

