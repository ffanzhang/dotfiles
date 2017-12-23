# checks if a command is there
command_exists() {
    command -v "$1" > /dev/null
}

# $1: source file directory
# $2: dest file directory
install_with_bak() {
    if [ -f $2 ]
    then
        # only make a backup if the new file is different
        if [ "$(diff $1 $2)" != "" ]
        then
            mv $2 $2.bak.$(date +%s%3N)
        fi
    fi
    cp $1 $2
}
