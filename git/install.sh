#!/bin/bash

git config --global difftool.prompt false
git config --global merge.conflictstyle diff3
git config --global mergetool.prompt false
git config --global diff.tool vimdiff
git config --global merge.tool vimdiff
