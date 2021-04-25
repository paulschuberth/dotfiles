#!/usr/bin/env bash

# load submodules
git submodule update --init --recursive


# Environment setup
script_dir=$(pwd)

# load vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


#link_to_home "vim/" "~/.vim/"
#link_to_home "alacritty.yml" "~/.config/alacritty/alacritty.yml"
#link_to_home "tmux/tmux.conf" "~/.tmux.conf"
#link_to_home "karabiner.json" "~/.config/karabiner/karabiner.json"
#link_to_home "fish/" "~/.config"
#link_to_home "starship.toml" "~/.config/starship.toml"
#link_to_home ".gitconfig" 
#link_to_home "bat/" "~/.config"

original="$script_dir"/"$1"
basename=$(basename $original)

ln -sF ~/dotfiles/bat/ ~/.config/bat
ln -sF ~/dotfiles/alacritty/ ~/.config/alacritty
ln -sF ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -sF ~/dotfiles/karabiner/ ~/.config/karabiner
ln -sF ~/dotfiles/fish/ ~/.config/fish
ln -sF ~/dotfiles/starship/starship.toml ~/.config/starship.toml
ln -sF ~/dotfiles/.gitconfig ~/.gitconfig
ln -sF ~/dotfiles/vim ~/.vim
