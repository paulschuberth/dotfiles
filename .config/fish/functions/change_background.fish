
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
            ln -s -f ~/.config/alacritty/themes/themes/tomorrow_night.toml ~/.config/alacritty/theme.toml
            set -U BAT_THEME Tomorrow-Night
            alacritty-themes github_dark
            git config --global delta.light false
        case light
            ln -s -f ~/.config/alacritty/themes/themes/github_light.toml ~/.config/alacritty/theme.toml
            set -U BAT_THEME GitHub
            alacritty-themes github_light
            git config --global delta.light true
    end
end

