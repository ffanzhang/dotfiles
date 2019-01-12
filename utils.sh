# checks if a command is there
command_exists() {
    command -v "$1" > /dev/null
}

# $1: source file directory
# $2: dest file directory
install_with_bak() {
    # only make a backup if the new file is different
    if [ -f $2 ] && ! [ "$(diff $1 $2)" == "" ]
    then
        mv $2 $2.bak.$(date +%Y%m%d-%H-%M-%S).$(date +%s%3N)
    fi 
    cp $1 $2
}
