command_exists() {
  command -v "$1" > /dev/null
}

if command_exists yum
then
  sudo yum -y update
  sudo yum -y install vim
  sudo yum -y install git
fi

if command_exists apt-get
then
  sudo apt-get update
  sudo apt-get install vim
  sudo apt-get install git
fi

if command_exists pacman
then
  sudo pacman -Syu
  sudo pacman -S vim
  sudo pacman -S git
fi

if command_exists brew
then
  brew update
  brew install vim
  brew install macvim
  brew link macvim
  brew install git
  brew install gcc-6
fi

for folder in `find * -type d`
do
	pushd $folder
	./install.sh
	popd
done
