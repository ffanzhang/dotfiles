#!/bin/bash
mv ~/.Xresources ~/.Xresources.bak.$(date -%s)
cp Xresources ~/.Xresources
xrdb -merge ~/.Xresources
