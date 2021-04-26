
set PATH "$PATH:/Users/schuberth/bin:/Users/schuberth/.sdkman/bin"
fish_add_path /Users/schuberth/bin
fish_add_path /Users/schuberth/.sdkman/bin
fish_add_path /Users/schuberth/.cargo/bin

set fish_greeting

starship init fish | source
