command_exists() {
        command -v "$1" > /dev/null
}

if command_exists vim && command_exists git
then
	git config --global diff.tool vimdiff
	git config --global difftool.prompt false
	git config --global merge.tool vimdiff
	git config --global mergetool.prompt false
	git config --global merge.conflictstyle diff3
fi
