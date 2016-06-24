for folder in `find * -type d`
do
	pushd $folder
	./install.sh
	popd
done
