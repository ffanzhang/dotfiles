#!/bin/bash
source ./utils.sh

install_with_bak vim/vimrc_simple ~/.vimrc
install_with_bak vim/editorconfig ~/.editorconfig
install_with_bak vim/tern-project ~/.tern-project
install_with_bak Xresources/Xresources ~/.Xresources
install_with_bak tmux/tmux.conf ~/.tmux.conf

touch ~/.inputrc
echo set bell-style none > ~/.inputrc

xrdb -load ~/.Xresources
echo done with basic setup
