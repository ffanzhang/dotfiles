#!/bin/bash
system_is_ARCH=$(uname -r | grep ARCH)
if [ ${#system_name} -gt 0 ]
then
    if ! [ -x package-query ]
    then
        git clone https://aur.archlinux.org/package-query.git
        cd package-query
        makepkg -si
        cd ..
    fi

    if ! [ -x yaourt ]
    then
        git clone https://aur.archlinux.org/yaourt.git
        cd yaourt
        makepkg -si
        cd ..
    fi
fi
