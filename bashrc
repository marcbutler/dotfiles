# -*- Mode: shell-script -*-

# Assumes dotfiles/bash_profile has been evaluated.

add_to_path $HOME/.local/bin
add_to_path /lib/cargo/bin
add_to_path /opt/hiroco/bin

# Protect myself from myself.
alias mv='mv -i'
alias cp='cp -i'
alias rm='rm -I'

