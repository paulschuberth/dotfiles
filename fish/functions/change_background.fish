
# change background to the other mode. 
function change_background

    # Try to get the current mode
    set -f current_mode (defaults read -g AppleInterfaceStyle 2> /dev/null)
    # if current_mode is empty we are in light mode
    if test -z $current_mode
        set -f current_mode Light
    end

    if [ "$current_mode" = "Dark" ]
        set -f new_mode light
    else
        set -f new_mode dark
    end


    # change macOS
    switch $new_mode
    case light
      osascript -l JavaScript -e "Application('System Events').appearancePreferences.darkMode = false" &>/dev/null
    case dark
      osascript -l JavaScript -e "Application('System Events').appearancePreferences.darkMode = true" &>/dev/null
    end

    # change alacritty
    set -e BAT_THEME
    switch $new_mode
        case dark
            alacritty-themes $ALACRITTY_THEME_DARK
            set -U BAT_THEME Tomorrow-Night
        case light
            alacritty-themes $ALACRITTY_THEME_LIGHT
            set -U BAT_THEME Tomorrow
    end

    # well, seems like there is no proper way to send a command to 
    # Vim as a client. Luckily we're using tmux, which means we can 
    # iterate over all vim sessions and change the background ourself.

    set brew_prefix (brew --prefix)
    set -l tmux_wins ($brew_prefix/bin/tmux list-windows -t main)

    # Resource init.vim for all vim instances after the theme has been changed
    for wix in ($brew_prefix/bin/tmux list-windows -t main -F 'main:#{window_index}')
        for pix in ($brew_prefix/bin/tmux list-panes -F 'main:#{window_index}.#{pane_index}' -t $wix)
            set -l is_vim "ps -o state= -o comm= -t '#{pane_tty}'  | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|n?vim?x?)(diff)?\$'"
            $brew_prefix/bin/tmux if-shell -t "$pix" "$is_vim" "send-keys -t $pix ':source ~/dotfiles/neovim/init.vim' ENTER"
        end
    end
end
