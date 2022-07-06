function change_background --argument mode_setting
  # change background to the given mode. If mode is missing, 
  # we try to deduct it from the system settings.

  set -f mode "light" # default value
  if test -z $mode_setting
    if test output (defaults read -g AppleInterfaceStyle 2> /dev/null) = "Dark"
      set -f mode "light"
    else
      set -f mode "dark"
    end
  else
    switch $mode_setting
      case light
        osascript -l JavaScript -e "Application('System Events').appearancePreferences.darkMode = false" &>/dev/null
        set -f mode "light"
      case dark
        osascript -l JavaScript -e "Application('System Events').appearancePreferences.darkMode = true" &>/dev/null
        set -f mode "dark"
    end
  end

# change alacritty
  switch $mode
    case dark
       alacritty-themes $ALACRITTY_THEME_DARK
    case light
        alacritty-themes $ALACRITTY_THEME_LIGHT
  end

  # well, seems like there is no proper way to send a command to 
  # Vim as a client. Luckily we're using tmux, which means we can 
  # iterate over all vim sessions and change the background ourself.

  set brew_prefix (brew --prefix)
  set -l tmux_wins ($brew_prefix/bin/tmux list-windows -t main)

  for wix in ($brew_prefix/bin/tmux list-windows -t main -F 'main:#{window_index}')
    for pix in ($brew_prefix/bin/tmux list-panes -F 'main:#{window_index}.#{pane_index}' -t $wix)
      set -l is_vim "ps -o state= -o comm= -t '#{pane_tty}'  | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?\$'"
      $brew_prefix/bin/tmux if-shell -t "$pix" "$is_vim" "send-keys -t $pix ':source ~/dotfiles/neovim/init.vim' ENTER"
    end
  end


end
