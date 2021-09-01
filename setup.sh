#!/usr/bin/env bash

# load submodules
git submodule update --init --recursive

# load vim.plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Environment setup
script_dir=$(pwd)

rm ~/.config/bat
ln -sF ~/dotfiles/bat/ ~/.config/bat

rm ~/.config/alacritty
ln -sF ~/dotfiles/alacritty/ ~/.config/alacritty

rm -rf ~/.tmux.conf
ln -sF ~/dotfiles/tmux/tmux.conf ~/.tmux.conf

rm ~/.config/karabiner
ln -sF ~/dotfiles/karabiner/ ~/.config/karabiner

rm ~/.config/fish
ln -sF ~/dotfiles/fish/ ~/.config/fish

rm ~/.config/starship.toml
ln -sF ~/dotfiles/starship/starship.toml ~/.config/starship.toml

rm ~/.gitconfig
ln -sF ~/dotfiles/git/gitconfig ~/.gitconfig

rm -rf ~/.vim
ln -sF ~/dotfiles/vim/ ~/.vim

rm ~/.vimrc
ln -sF ~/dotfiles/vim/vimrc ~/.vimrc
rm ~/.ideavimrc
ln -sF ~/dotfiles/vim/vimrc ~/.ideavimrc

ln -sF ~/dotfiles/io.arslan.dark-mode-notify.plist ~/Library/LaunchAgents/io.arslan.dark-mode-notify.plist

cd utils/
swiftc notify.swift -o notify
cp notify /usr/local/bin/dark-mode-notify
