#!/bin/bash

source ./utils.sh
source ./install_simple.sh

echo starting slightly longer setup

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
    brew install gcc-6
fi

for item in `ls`
do
    # if a directory go in
    if [ -d $item ]
    then
        pushd $item
        if [ -f install.sh ]
        then
            ./install.sh
        fi
        popd
    fi
done

touch inputrc
echo set bell-style none > inputrc
install_with_bak inputrc ~/.inputrc
rm inputrc

