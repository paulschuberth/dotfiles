#!/usr/bin/env bash

filesAndDirsToLink=".vim/ .vim/.vimrc alacritty.yml .tmux.conf .oh-my-zsh .zshrc karabiner.json"

# Environment setup
script_dir=$(pwd)

link_to_home() {

  original="$script_dir"/"$1"
  basename=$(basename $original)
  link="$HOME/$basename"

  if [[ $basename == "alacritty.yml" ]]; then
      link="$HOME/.config/alacritty/alacritty.yml"
  fi

  if [[ $basename == "karabiner.json" ]]; then
      link="$HOME/.config/karabiner/karabiner.json"
  fi

  if [ -z "$1" ]; then
    echo "No source file defined. Cannot link to home."
  else
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
  fi
}


for toLink in $filesAndDirsToLink; do
  link_to_home $toLink
done
