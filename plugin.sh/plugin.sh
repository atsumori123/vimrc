#!/bin/bash

#---------------------------------------
# Plugin install directory
#---------------------------------------
plugindir="$HOME/vimplugins"

#---------------------------------------
# Define plugins
#---------------------------------------
plugins=(
	"jonathanfilip/vim-lucius"
	"easymotion/vim-easymotion"
	"numToStr/Comment.nvim"
	"sindrets/diffview.nvim"
	"akinsho/toggleterm.nvim"
	"lewis6991/gitsigns.nvim"
	"hedyhli/outline.nvim"
	"vim-jp/vimdoc-ja"
	"atsumori123/stline.vim"
	"atsumori123/gr.vim"
	"atsumori123/oldfiles.vim"
	"atsumori123/various.vim"
	"atsumori123/minfy.vim"
	"atsumori123/oldfiles.nvim"
	"atsumori123/various.nvim"
	"neovim/nvim-lspconfig"
	"williamboman/mason.nvim"
	"williamboman/mason-lspconfig.nvim"
)

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
		echo "          r|remove  -- Remove [plugin]"
		echo "          l|list    -- List of installed plugins"
esac
