#!/bin/bash

if ! [ -d vim ]
then
    git clone https://github.com/vim/vim.git
fi

sudo apt-get install libncurses5
pushd vim
git stash
git submodule update --init --recursive

./configure --enable-pythoninterp=yes \
            --with-tblib=ncurses \
            --prefix=/usr/local

make VIMRUNTIMEDIR=/usr/local/share/vim/vim80
popd
