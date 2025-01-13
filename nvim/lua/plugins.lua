local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local sep = vim.fn.execute('echo has("unix")') and '/' or '\\'
local VimPluginsPath = vim.env.HOME..sep..'vimplugins'
local VimPlugins = {}

local function plug(plugin)
	table.insert(VimPlugins, plugin)
end

local function Enabled(plugin)
	for k, v in pairs(VimPlugins) do
		if v == plugin then return true end
	end
	return false
end

----------------------------------------
-- Define load plugin
----------------------------------------
plug('vim-lucius')
plug('gr.vim')
plug('oldfiles.nvim')
plug('minfy.vim')
plug('stline.vim')
plug('various.vim')
plug('vim-easymotion')
plug('diffview.nvim')
plug('Comment.nvim')
plug('toggleterm.nvim')
plug('gitsigns.nvim')
plug('outline.nvim')
plug('nvim-lspconfig')
plug('mason.nvim')

----------------------------------------
-- Define plugin loading configuration
----------------------------------------
local function load_config()
	-- jonathanfilip/vim-lucius
	if Enabled('vim-lucius') then
		vim.cmd('colorscheme lucius')
		vim.cmd('highlight Search ctermbg=222 ctermfg=0 guibg=moccasin guifg=#484848')
	end

	-- vim-scripts/taglist.vim
	if Enabled('taglist.vim') then
		vim.g.Tlist_GainFocus_On_ToggleOpen = 1		-- When you open the tag list, focus on the tag list
		vim.g.Tlist_File_Fold_Auto_Close = 1		-- Automatically close tag list when file is inactive
		vim.g.Tlist_Show_One_File = 1				-- Show only the tags of the source you are currently editing
		map('n', '<F11>', ':TlistToggle<CR>', opts)
	end

	-- atsumori123/stline.vim
	if Enabled('stline.vim') then
		vim.g.stline_theme = 'monochrome'
		map('n', '<leader>1', '<Plug>STLine.Go(1)', opts)
		map('n', '<leader>2', '<Plug>STLine.Go(2)', opts)
		map('n', '<leader>3', '<Plug>STLine.Go(3)', opts)
		map('n', '<leader>4', '<Plug>STLine.Go(4)', opts)
		map('n', '<leader>5', '<Plug>STLine.Go(5)', opts)
		map('n', '<leader>6', '<Plug>STLine.Go(6)', opts)
		map('n', '<leader>7', '<Plug>STLine.Go(7)', opts)
		map('n', '<leader>8', '<Plug>STLine.Go(8)', opts)
		map('n', '<leader>9', '<Plug>STLine.Go(9)', opts)
		map('n', '<leader>0', '<Plug>STLine.Go(10)', opts)
	end

	-- atsumori123/gr.vim
	if Enabled('gr.vim') then
		map('', '<leader>g', ':Gr<CR>', opts)
		vim.g.GR_GrepCommand = 'ripgrep'
	end

	-- atsumori123/oldfiles.nvim
	if Enabled('oldfiles.nvim') then
		require('oldfiles').setup()
		map('n', '<leader>l', ':OldFiles<CR>', opts)
	end

	-- atsumori123/various.vim
	if Enabled('various.vim') then
		map('n', '<leader>b', '<Plug>(various-buffer)<CR>', opts)
		map('n', '<leader>m', '<Plug>(various-marks)<CR>', opts)
		map('n', '<S-j>', '<Plug>(various-next-buffer)<CR>', opts)
		map('n', '<S-k>', '<Plug>(various-prev-buffer)<CR>', opts)
		map('n', '<leader>x', '<Plug>(various-close)<CR>', opts)
		map('n', '<C-p>', '<Plug>(various-preview)<CR>', opts)
		map('n', '<leader>q', '<Plug>(various-quickfix)<CR>', opts)
		map('n', 'zc', '<Plug>(various-display-in-center)<CR>', opts)
		map('n', '<C-t>', '<Plug>(various-toggle-terminal)<CR>', opts)
		map('t', '<C-t>', '<Plug>(various-toggle-terminal)<CR>', opts)
		map('', '<leader>r', ':Replace<CR>', opts)
		map('', '<leader>t', ':Tips<CR>', opts)
	end

	-- atsumori123/minfy.vim
	if Enabled('minfy.vim') then
		map('n', '<c-o>', ':execute "Minfy ".expand("%:p:h")<CR>', opts)
	end

	-- vim-EasyMotionTarget
	if Enabled('vim-easymotion') then
		vim.g.EasyMotion_do_mapping = 0
		vim.g.EasyMotion_smartcase = 1
		vim.g.EasyMotion_use_migemo = 1
		vim.g.EasyMotion_use_upper = 1
		vim.g.EasyMotion_keys='hklyuiopnm,qwertzxcvbasdgjf'
		map('n', 'f', '<Plug>(easymotion-bd-f)', opts)
	end

	-- sindrets/diffview.nvim
	if Enabled('diffview.nvim') then
		require("diffview").setup({
			use_icons = false,
		})
		local diffview_func = function()
			local mode = vim.fn.input("1:Changes, 2:File history, 3:Close : ")
			if	   mode == "1" then vim.cmd('DiffviewOpen')
			elseif mode == "2" then vim.cmd('DiffviewFileHistory')
			elseif mode == "3" then vim.cmd('DiffviewClose')
			end
			vim.cmd('echo "\r"')
		end
		vim.keymap.set('n', '<F9>', function() diffview_func() end)
	end

	-- numToStr/Comment.nvim
	if Enabled('Comment.nvim') then
		require('Comment').setup()
  		map('n', '<leader>c', '<Plug>(comment_toggle_linewise_current)', opts)
	    map('x', '<leader>c', '<Plug>(comment_toggle_linewise_visual)', opts)
	end

	-- akinsho/toggleterm.nvim
	if Enabled('toggleterm.nvim') then
		require('toggleterm').setup{
			open_mapping = [[<c-\>]],
			direction = 'float',
		}
	end

	-- lewis6991/gitsigns.nvim
	if Enabled('gitsigns.nvim') then
		require('gitsigns').setup()
	end

	-- hedyhli/outline.nvim
	if Enabled('outline.nvim') then
		require('outline').setup()
		map('n', '<F11>', ':Outline<CR>', opts)
	end

	-- williamboman/mason.nvim
	if Enabled('mason.nvim') then
		require("mason").setup()
	end

	-- neovim/nvim-lspconfig
	if Enabled('nvim-lspconfig') then
		local lspconfig = require("lspconfig")
		lspconfig.clangd.setup({})
		vim.diagnostic.disable()
	end

	-- test
--	map('n', '<leader>[', ':source ~/vimfiles/script/test.vim<CR>', opts)
end

----------------------------------------
-- Define plugin lazy setup
----------------------------------------
local lazy_setup = function()
	-- vim-EasyMotionTarget
	if Enabled('vim-easymotion') then
		vim.cmd('highlight EasyMotionTarget cterm=bold ctermbg=black ctermfg=cyan gui=bold guibg=black guifg=cyan')
	end
end

----------------------------------------
-- Plugin add to runtimepath
----------------------------------------
for k, plugin in pairs(VimPlugins) do
	local path = VimPluginsPath .. sep .. plugin
	if vim.fn.isdirectory(path) then
		vim.fn.execute('set runtimepath+=' .. path)
	end
end
load_config()

----------------------------------------
-- Autocmd for plugin lazy setup
----------------------------------------
vim.api.nvim_create_augroup('LazySetup', { clear = true })
vim.api.nvim_create_autocmd({ 'vimenter' }, {
	pattern = {'*'},
	group = 'LazySetup',
	callback = lazy_setup,
})
