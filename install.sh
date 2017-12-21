source ./utils.sh

./install_simple.sh

if command_exists yum
then
    sudo yum -y update
    sudo yum -y install vim
    sudo yum -y install wget
fi

if command_exists apt-get
then
    sudo apt-get -y update
    sudo apt-get -y install vim
    sudo apt-get -y install wget
fi

if command_exists pacman
then
    sudo pacman -Syu
    sudo pacman -S vim
    sudo pacman -S wget
fi

if command_exists brew
then
    brew update
    brew install vim
    brew install macvim
    brew link macvim
    brew install wget 
    brew install gcc-6
fi

for folder in `find * -type d`
do
    pushd $folder
    ./install.sh
    popd
done
