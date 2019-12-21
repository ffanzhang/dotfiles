vim -S test/testvim.vim +qall
if ! [ -f vimpassed.txt ]; then
    exit 1;
fi
