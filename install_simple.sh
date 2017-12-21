#!/bin/bash

source ./utils.sh
install_with_bak vim/vimrc_simple ~/.vimrc
install_with_bak vim/editorconfig ~/.editorconfig
install_with_bak vim/tern-project ~/.tern-project
install_with_bak Xresources/Xresources ~/.Xresources

if [ ! -f ~/.tmux.conf ]
then
    touch ~/.tmux.conf
fi

# vi key bindings for tmux scrolling
if [ $(grep -c set-window-option ~/.tmux.conf) -eq 0 ]
then
    echo "set-window-option -g mode-keys vi" >> ~/.tmux.conf
fi

xrdb -merge ~/.Xresources
echo done
