#!/bin/bash
if ! [ -d ~/.solarized/dircolors-solarized ]; then
    git clone https://github.com/seebi/dircolors-solarized.git ~/.solarized/dircolors-solarized
else
    pushd ~/.solarized/dircolors-solarized
    git submodule update --recursive
    popd
fi

option=1

test -e ~/.dircolors && mv ~/.dircolors ~/.dircolors.bak.$(date +%Y%m%d-%H-%M-%S).$(date +%s%3N)

# 1 works for xterm and rxvt
if [ $option == 1 ]; then
    ln -s ~/.solarized/dircolors-solarized/dircolors.ansi-dark ~/.dircolors
else
    ln -s ~/.solarized/dircolors-solarized/dircolors.256dark ~/.dircolors
fi

test -e ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

echo 'eval "$(dircolors -b ~/.dircolors)"' >> ~/.bashrc
source ~/.bashrc
