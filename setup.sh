#!/usr/bin/env bash

# load submodules
git submodule update --init --recursive

# load vim.plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


# Environment setup
script_dir=$(pwd)

rm ~/.config/bat
ln -sF ~/dotfiles/bat/ ~/.config/bat

rm ~/.config/fish
ln -sF ~/dotfiles/fish/ ~/.config/fish

rm ~/.config/starship.toml
ln -sF ~/dotfiles/starship/starship.toml ~/.config/starship.toml

rm ~/.gitconfig
ln -sF ~/dotfiles/git/gitconfig ~/.gitconfig

rm ~/.config/nvim/init.vim
ln -sF ~/dotfiles/neovim/init.vim ~/.config/nvim/init.vim
rm ~/.ideavimrc
ln -sF ~/dotfiles/neovim/init.vim ~/.ideavimrc

if [ `uname -s` = 'Darwin' ]; then
	./dark-mode-setup.sh

	rm ~/.config/karabiner
	ln -sF ~/dotfiles/karabiner/ ~/.config/karabiner

	rm -rf ~/.tmux.conf
	ln -sF ~/dotfiles/tmux/tmux.conf ~/.tmux.conf

	rm ~/.config/alacritty
	ln -sF ~/dotfiles/alacritty/ ~/.config/alacritty

fi
