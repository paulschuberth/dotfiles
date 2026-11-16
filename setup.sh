mkdir -p ~/dotfiles/.config/alacritty
cat > ~/dotfiles/.config/alacritty/shell.toml <<EOL
[shell]
args = ["--login"]
program = "$(brew --prefix)/bin/fish"
EOL
