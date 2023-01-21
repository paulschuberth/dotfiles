#!/usr/bin/env bash
# load submodules
git submodule update --init --recursive

# load vim.plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


# Environment setup
script_dir=$(pwd)

rm ~/.config/bat &> /dev/null
rm -rf ~/.config/bat &> /dev/null
ln -sF ~/dotfiles/bat/ ~/.config/bat

rm ~/.config/fish &> /dev/null
rm -rf ~/.config/fish &> /dev/null
ln -sF ~/dotfiles/fish/ ~/.config/fish

if command -v starship &> /dev/null; then
    rm ~/.config/starship.toml
    ln -sF ~/dotfiles/starship/starship.toml ~/.config/starship.toml
fi

rm ~/.gitconfig &> /dev/null
ln -sF ~/dotfiles/git/gitconfig ~/.gitconfig

rm ~/.gitconfig-acpp &> /dev/null
ln -sF ~/dotfiles/git/gitconfig-acpp ~/.gitconfig-acpp

rm ~/.gitconfig-acpp-backend &> /dev/null
ln -sF ~/dotfiles/git/gitconfig-acpp-backend ~/.gitconfig-acpp-backend

rm ~/.gitconfig-personal &> /dev/null
ln -sF ~/dotfiles/git/gitconfig-personal ~/.gitconfig-personal

rm ~/.config/nvim/init.vim
rm ~/.config/nvim/init.lua
ln -sF ~/dotfiles/neovim/init.lua ~/.config/nvim/init.lua
rm ~/.ideavimrc &> /dev/null
ln -sF ~/dotfiles/neovim/init.vim ~/.ideavimrc

if [[ $(uname -s) == Darwin ]]; then
    
    ./dark-mode-setup.sh

    rm ~/.config/karabiner &> /dev/null
    rm -rf ~/.config/karabiner &> /dev/null
    ln -sF ~/dotfiles/karabiner/ ~/.config/karabiner

    rm -rf ~/.tmux.conf &> /dev/null
    ln -sF ~/dotfiles/tmux/tmux.conf ~/.tmux.conf

    rm ~/.config/alacritty &> /dev/null
    rm -rf ~/.config/alacritty &> /dev/null
    ln -sF ~/dotfiles/alacritty/ ~/.config/alacritty

    # Link the base16 colors into the alacritty color directory
    ln -sF ~/dotfiles/themes/base16-alacritty/colors/ ~/.config/alacritty

fi
