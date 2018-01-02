source ../utils.sh

if command_exists git
then
    git config --global difftool.prompt false
    git config --global merge.conflictstyle diff3
    git config --global mergetool.prompt false

    if command_exists vim
    then
        git config --global diff.tool vimdiff
        git config --global merge.tool vimdiff
    fi
fi
