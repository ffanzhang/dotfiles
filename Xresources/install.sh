#!/bin/bash
source ${BASH_SOURCE%/*}/../utils.sh
install_with_bak Xresources ~/.Xresources
xrdb -load ~/.Xresources
