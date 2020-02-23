#!/bin/bash
source ./utils.sh

simple=0
while getopts "hsv" arg; do
    case $arg in
        h)
            echo "Usage: ./install.sh [-s | -v]"
            exit 0;
            ;;
        s)
            simple=1
            ;;
        v)
            install_with_bak vim/vimrc_simple ~/.vimrc;
            install_with_bak vim/quick_plugins/monoline.vim ~/.monoline.vim;
            install_with_bak vim/quick_plugins/monotree.vim ~/.monotree.vim;
            exit 0;
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

echo story time 

STORY_TIME="vi vim nvim tmux gcc g++ python python3 git ninja curl wget cmake pkgconfig"

if command_exists yum
then
    sudo yum -y update
    sudo yum -y install $STORY_TIME
fi

if command_exists apt-get
then
    sudo apt-get -y update
    sudo apt-get -y install $STORY_TIME
fi

if command_exists pacman
then
    sudo pacman -Syu
    sudo pacman -S $STORY_TIME 
fi

if command_exists brew
then
    brew update
    brew install -f $STORY_TIME 
fi

echo configure time
./git/install.sh
