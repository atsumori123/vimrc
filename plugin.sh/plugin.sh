#!/bin/bash

#---------------------------------------
# Plugin install directory
#---------------------------------------
plugindir="$HOME/vimplugins"

#---------------------------------------
# Define plugins
#---------------------------------------
plugins=()
	plugins+=("cocoon/iceberg.vim")
	plugins+=("vim-jp/vimdoc-ja")
	plugins+=("atsumori123/stline.vim")
	plugins+=("atsumori123/gr.vim")
	plugins+=("atsumori123/filefinder.vim")
	plugins+=("atsumori123/unmemorable.vim")
	plugins+=("atsumori123/minfy.vim")
	plugins+=("atsumori123/oldfiles.nvim")
	plugins+=("atsumori123/glog.vim")
	plugins+=("atsumori123/winbuf.vim")
	plugins+=("atsumori123/popupmarks.vim")
	plugins+=("atsumori123/scripts.vim")

#---------------------------------------
# Script
#---------------------------------------
case $1 in
	i|install)
		if [ "$#" -eq 2 ]; then
			git clone --depth 1 https://github.com/$2 $plugindir/$(basename "$2")
		else
			for plugin in "${plugins[@]}"; do
				if [ ! -d $plugindir/$(basename "$plugin") ]; then
					echo ">>>>> "$plugin
					git clone --depth 1 https://github.com/$plugin $plugindir/$(basename "$plugin")
					echo ""
					sleep 0.5
				fi
			done
		fi
		;;

	u|update)
		if [ "$#" -eq 2 ]; then
			git -C $plugindir/$2 pull
		else
			for plugin in "${plugins[@]}"; do
				echo ">>>>> "$plugin
				git -C $plugindir/$(basename "$plugin") pull
				echo ""
				sleep 0.5
			done
		fi
		;;

	r|remove)
		if [ "$#" -eq 2 ]; then
			rm -rf -- "$plugindir/$(basename "$2")"
		else
			for path in $plugindir/*; do
				if [ -d $path ]; then
					dir=$(basename "$path")
					if ! printf '%s\n' "${plugins[@]}" | grep -q $dir; then
						echo -n "Remove \"$dir\" ? : "
						read input
						if [ ! -z $input ]; then
							if [ $input = "y" ] || [ $input = "Y" ]; then
								rm -rf -- $path
							fi
						fi
					fi
				fi
			done
		fi
		;;

	l|list)
		ls -- "$plugindir" ;;

	*)
		echo ""
		echo "Usage:"
		echo "  $ plug.sh [cmd] [plugin]"
		echo "    cmd : i|install -- Install [plugin]"
		echo "          u|update  -- Update [plugin]"
		echo "          r|remove  -- Remove [plugin]"
		echo "          l|list    -- List of installed plugins"
esac
