#!/bin/bash
mv ~/.Xresources ~/.Xresources.bak
cp Xresources ~/.Xresources
xrdb -merge ~/.Xresources
