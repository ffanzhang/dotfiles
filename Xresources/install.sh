#!/bin/bash
source $PWD/../utils.sh
install_with_bak Xresources ~/.Xresources
xrdb -load ~/.Xresources
