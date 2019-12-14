#!/bin/bash
source ${BASH_SOURCE%/*}/utils.sh

simple=0
while getopts "hs" arg; do
    case $arg in
        h)
            echo "Usage: ./install.sh [-s]"
            exit 0;
            ;;
        s)
            simple=1
            ;;
    esac
done

install_with_bak vim/vimrc_simple ~/.vimrc
install_with_bak vim/quick_plugins/monoline.vim ~/.monoline.vim
install_with_bak vim/quick_plugins/monotree.vim ~/.monotree.vim
install_with_bak vim/editorconfig ~/.editorconfig
install_with_bak vim/tern-project ~/.tern-project
install_with_bak Xresources/Xresources ~/.Xresources
install_with_bak tmux/tmux.conf ~/.tmux.conf
install_with_bak i3/config ~/.i3/config

touch inputrc
echo set bell-style none > inputrc
install_with_bak inputrc ~/.inputrc
rm inputrc

xrdb -load ~/.Xresources

if [ $((simple)) -eq 1 ]; then
    echo Done with simple setup, exiting;
    exit 0;
fi

echo Starting a slightly longer setup

if command_exists yum
then
    sudo yum -y update
    sudo yum -y install vim
    sudo yum -y install wget
fi

if command_exists apt-get
then
    sudo apt-get -y update
    sudo apt-get -y install vim
    sudo apt-get -y install wget
    sudo apt-get -y install tmux
    sudo apt-get -y install xsel 
    sudo apt-get -y install rxvt-unicode
fi

if command_exists pacman
then
    sudo pacman -Syu
    sudo pacman -S vim
    sudo pacman -S wget
fi

if command_exists brew
then
    brew update
    brew install vim
    brew install macvim
    brew link macvim
    brew install wget 
    brew install gcc
fi

for item in `ls`
do
    # if a directory go in
    if [ -d $item ]
    then
        if [ -f $item/install.sh ]
        then
            ./$item/install.sh
        fi
    fi
done
