```
make simple
```
- quick version of install

```
make
```
- comprehensive install

# caveats
### Xresources
- works on arch, xterm settings doesn't work on ubuntu 14.04, one
  way to fix it is to add namespace before wildstars and duplicate colors

### vim
- clippboard needs to be unamedplus for some oses 
- youcompleteme is a pain to install, vim needs to be compiled with a python flag

### tmux
- $TERM variable of the terminal that initiates a tmux session must
be some variations of mode that supports 256 colors, (eg. screen-256color)
