#!/bin/bash

PLUGINDIR="$HOME/vimfiles/pack/myplugins/start"

 case $1 in
	i|install)
		git clone --depth 1 "https://www.github.com/$2" "$PLUGINDIR/$(basename "$2")" ;;

	r|remove)
		rm -rf -- "$PLUGINDIR/$(basename "$2")" ;;

	l|list)
		ls -- "$PLUGINDIR/" ;;

	*)
		echo ""
		echo "Usage:"
		echo "$ plugin.sh i [plugin name]"
		echo "$ plugin.sh r [plugin name]"
		echo "$ plugin.sh l"
esac
