#!/bin/bash
source ../utils.sh

if ! [ -d ~/.solarized ]
then
    mkdir ~/.solarized
fi

pushd ~/.solarized
if ! [ -d ~/.solarized/dircolors-solarized ];
then
    git clone https://github.com/seebi/dircolors-solarized.git
fi
popd

install_with_bak ~/.solarized/dircolors-solarized/dircolors.256dark ~/.dircolors

test -e ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
