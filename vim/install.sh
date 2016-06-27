#!/bin/bash
if [ -x /bin/vim ]
then
	if ! [ -d ~/.vim/bundle/Vundle.vim ]
	then
		git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
	fi

	pushd ~/.vim/bundle/Vundle.vim
	git pull origin master
	popd

	cp vimrc ~/.vimrc
	vim +PluginInstall +qall

	system_name=$(uname -r | grep ARCH)
	if [ ${#system_name} -gt 0 ]
	then
		ycm_string=$(yaourt -Qm | grep youcompleteme)
		if [ ${#ycm_string} -eq 0 ]
		then
			echo Installing youcompleteme using yaourt
			gpg --recv-keys F7E48EDB
			yaourt -S ncurses5-compat-libs
			yaourt -S vim-youcompleteme-git
		fi

                if ! [ -x /bin/latex ]
                then
                        yaourt -S texlive-most
                fi
	fi

	ycm_config_pathname=~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py
	if ! [ -f $ycm_config_pathname ]
	then
		echo Downloading C/C++ config file for youcompleteme
		wget https://raw.githubusercontent.com/Valloric/ycmd/master/cpp/ycm/.ycm_extra_conf.py -P ~/.vim/bundle/YouCompleteMe
	fi

	# install tern for javascript
	if [ -d ~/.vim/bundle/tern_for_vim ]
	then
		pushd ~/.vim/bundle/tern_for_vim
		if ! [ -d node_modules ]
		then
			echo Installing tern
			npm install
		fi
		popd
	fi

	# javascript autocompletion config file
	cp tern-project ~/.tern-project
fi
