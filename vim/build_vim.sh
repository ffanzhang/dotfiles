#!/bin/bash

if ! [ -d vim ]
then
    git clone https://github.com/vim/vim.git
fi

sudo apt-get install libncurses5
pushd vim
git stash
git submodule update --init --recursive
pushd src
sudo make distclean;
./configure --prefix=/usr/local \
            --with-features=huge \
            --with-tlib=ncurses \
            --enable-pythoninterp  \

sudo make;
sudo make install;
popd
popd
