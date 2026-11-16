set -gx EDITOR vim
set -gx LC_ALL en_US.UTF-8
set -gx LANG en_US.UTF-8
set -gx LANGUAGE en_US.UTF-8

eval (brew shellenv)


fish_add_path ~/bin
fish_add_path ~/.sdkman/bin
fish_add_path ~/go/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/Library/Python/3.9/bin
fish_add_path ~/.composer/vendor/bin
fish_add_path ~/dotfiles/cf-utils
fish_add_path ~/dotfiles/utils
fish_add_path ~/dotfiles/tools-by-ai
fish_add_path /home/linuxbrew/.linuxbrew/bin

fish_add_path $HOMEBREW_PREFIX/opt/mysql@5.6/bin
fish_add_path $HOMEBREW_PREFIX/sbin

fish_vi_key_bindings

fish_add_path $HOMEBREW_PREFIX/opt/php@8.2/bin
fish_add_path $HOMEBREW_PREFIX/opt/php@8.2/sbin

set fish_greeting


# Golang
set -xg GOPATH ~/code
set -xg GOBIN ~/go/bin

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


# Aliases
alias vim="nvim"
alias vi="nvim"
alias python="python3"
alias gs="git status"
alias gap="git add --patch"

# The fuck
thefuck --alias | source

# Git
git config --global alias.clean-branches "!git branch | grep -v -e main -e master -e develop | xargs git branch -D"

# FZF
## Setup bindings
fzf_configure_bindings --variables=\cv --processes=\cp --git_status=\cs --directory=\cf --git_log=\ch --history=\cr

zoxide init --cmd cd fish | source

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "~/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)


# Only required on macos
set -l os (uname)
if test "$os" = Darwin
	# Testcontainers with Rancher Desktop
	# export TESTCONTAINERS_HOST_OVERRIDE=$(rdctl shell ip a show vznat | awk '/inet / {sub("/.*",""); print $2}')
	export TESTCONTAINERS_HOST_OVERRIDE=$(rdctl shell ip a show rd1 | awk '/inet / {sub("/.*",""); print $2}')
end

# only required on WSL
set -l microsoft (uname -r | sed -n 's/.*\(microsoft\).*/\1/ip')
if test "$microsoft" = 'microsoft'
	mkdir -p /home/schuberth/tmp
	export TMPDIR=/home/schuberth/tmp
end
