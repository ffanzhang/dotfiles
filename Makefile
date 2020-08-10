DATE=$(shell date +%s)
default:
	./install.sh
kiss:
	mv ~/.vimrc ~/.vimrc.bak.$(DATE) || true
	cp vim/vimrc_simple ~/.vimrc
simple:
	./install.sh -s
quickvim:
	./install.sh -v
