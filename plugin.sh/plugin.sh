#!/bin/bash

plugindir="$HOME/vimplugins"

case $1 in
	i|install)
		git clone --depth 1 "https://github.com/$2" "$plugindir/$(basename "$2")" ;;

	r|remove)
		rm -rf -- "$plugindir/$(basename "$2")" ;;

	l|list)
		ls -- "$plugindir" ;;
	*)
		echo ""
		echo "Usage:"
		echo "  $ plug.sh [cmd] [plugin]"
		echo "    cmd : i|install -- Install [plugin]"
		echo "          r|remove  -- Remove [plugin]"
		echo "          l|list    -- List of installed plugins"
esac
