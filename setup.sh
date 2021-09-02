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

swiftc ./utils/notify.swift -o /usr/local/bin/dark-mode-notify
user=$(id -u)
launchctl bootout gui/$user io.arslan.dark-mode-notify.plist
launchctl bootstrap gui/$user io.arslan.dark-mode-notify.plist
launchctl kickstart -k -p gui/$user/io.arslan.dark-mode-notify
