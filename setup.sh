#!/usr/bin/env bash

# load submodules
git submodule update --init --recursive


# Environment setup
script_dir=$(pwd)

# load vim plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


link_to_home() {

  original="$script_dir"/"$1"
  basename=$(basename $original)

  link="$HOME/$2"
  if [[ -z $2 ]]; then
    link="$HOME/$basename"
  fi

  if [[ $basename == "alacritty.yml" ]]; then
      link="$HOME/.config/alacritty/alacritty.yml"
  fi

  if [[ $basename == "karabiner.json" ]]; then
      link="$HOME/.config/karabiner/karabiner.json"
  fi

  if [[ $basename == "config.fish" ]]; then
      link="$HOME/.config/fish/config.fish"
  fi

  create_new=true
  file_already_exists=false
  directory_already_exists=false

  # Check for preexisting directories, files or links
  if [[ -L ${link} ]] || [[ -e ${link} ]]; then
    file_already_exists=true
    echo "A file or symlink $link already exists. Do you want to create_new it? y/[n]"
    read -r overwrite_input

    if [[ $overwrite_input != "y" ]]; then
      create_new=false
    fi

  elif [[ -d ${link} ]]; then
    directory_already_exists=true
    echo "A directory $link already exists. Do you want to replace it with a symlink? y/[n]"
    read -r overwrite_input
  fi

  # Create the symlink
  if [[ $create_new == true ]]; then

    if [[ $file_already_exists == true ]]; then
      rm "$link"
    fi

    if [[ $directory_already_exists == true ]]; then
      rm -rf "$link"
    fi

    ln -s "$original" "$link"
    if [[ $basename == ".vimrc" ]]; then
      ln -sf "$original" "$HOME/.ideavimrc"
    fi
  fi
}

link_to_home "vim" ".vim/"
link_to_home "vim/vimrc" ".vim/.vimrc"
link_to_home "alacritty.yml" ".config/alacritty/alacritty.yml"
link_to_home "tmux/tmux.conf" ".tmux.conf"
link_to_home "karabiner.json" ".config/karabiner/karabiner.json"
link_to_home "fish" ".config/fish/"
link_to_home "starship.toml" ".config/starship.toml"
