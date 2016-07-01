#!/bin/bash

command_exists () {
        command -v "$1" > /dev/null
}

if command_exists vim
then
	if ! [ -d ~/.vim/bundle/Vundle.vim ]
	then
		sudo git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	fi

	pushd ~/.vim/bundle/Vundle.vim
        sudo git stash
	sudo git pull origin master
	popd

        sudo cp vimrc ~/.vimrc
	sudo vim +PluginInstall +qall

        if command_exists apt-get
        then
                # note for ubuntu may need to compile vim with python options
                if ! command_exists clang
                then
                        sudo apt-get install clang
                fi

                if ! dpkg -s llvm
                then
                        sudo apt-get install llvm
                fi
        fi
        
	if command_exists pacman && command_exists yaourt
	then
		ycm_string=$(yaourt -Qm | grep youcompleteme)
		if [ ${#ycm_string} -eq 0 ]
		then
			echo Installing youcompleteme using yaourt
			gpg --recv-keys F7E48EDB &
			yaourt -S ncurses5-compat-libs &
			yaourt -S vim-youcompleteme-git &
		fi

                if ! command_exists latex
                then
                        yaourt -S texlive-most &
                fi
        else
                echo Installing using another method
                # attempt to manually compile youcompleteme in background
                # sudo ~/.vim/bundle/YouCompleteMe/install.py --all &
	fi

	ycm_config_pathname=~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py
	if ! [ -f $ycm_config_pathname ]
	then
		echo Downloading C/C++ config file for youcompleteme
		sudo wget https://raw.githubusercontent.com/Valloric/ycmd/master/cpp/ycm/.ycm_extra_conf.py -P ~/.vim/bundle/YouCompleteMe
	fi

	# install tern for javascript
	if [ -d ~/.vim/bundle/tern_for_vim ]
	then
		pushd ~/.vim/bundle/tern_for_vim
		if ! [ -d node_modules ] && command_exists npm
		then
			echo Installing tern
			sudo npm install
		fi
		popd
	fi

	# javascript autocompletion config file
	cp tern-project ~/.tern-project
fi
