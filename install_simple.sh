#!/bin/bash
source ./utils.sh
install_with_bak vim/vimrc_simple ~/.vimrc
install_with_bak vim/editorconfig ~/.editorconfig
install_with_bak vim/tern-project ~/.tern-project
install_with_bak Xresources/Xresources ~/.Xresources
xrdb -merge ~/.Xresources
echo done
