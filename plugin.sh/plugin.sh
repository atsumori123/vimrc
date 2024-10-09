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
#	"tpope/vim-fugitive"
	"nelstrom/vim-visual-star-search"
	"numToStr/Comment.nvim"
	"sindrets/diffview.nvim"
	"akinsho/toggleterm.nvim"
	"lewis6991/gitsigns.nvim"
	"hedyhli/outline.nvim"
#	"vim-jp/vimdoc-ja"
	"atsumori123/stline.vim"
	"atsumori123/gr.vim"
	"atsumori123/cmemo.vim"
	"atsumori123/oldfiles.vim"
	"atsumori123/buffer.vim"
	"atsumori123/minfy.vim"

	"neovim/nvim-lspconfig"
	"williamboman/mason.nvim"
	"williamboman/mason-lspconfig.nvim"
	"kevinhwang91/nvim-bqf"
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
