if [ -x /bin/vim ]
then
	git config --global diff.tool vimdiff
	git config --global difftool.prompt false
fi
