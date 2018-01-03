#!/bin/bash
source ../utils.sh
install_with_bak Xresources ~/.Xresources
xrdb -merge ~/.Xresources
