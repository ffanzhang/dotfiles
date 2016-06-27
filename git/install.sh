if [ -x /bin/vim ] && [ -x /bin/git ]
then
	git config --global diff.tool vimdiff
	git config --global difftool.prompt false
	git config --global merge.tool vimdiff
	git config --global mergetool.prompt false
	git config --global merge.conflictstyle diff3
fi
