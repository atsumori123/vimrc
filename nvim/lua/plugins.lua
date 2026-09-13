local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local sep = vim.fn.execute('echo has("unix")') and '/' or '\\'
local VimPluginsPath = vim.env.HOME..sep..'vimplugins'
local VimPlugins = {}

local function plug(plugin)
	table.insert(VimPlugins, plugin)
end

local function IsEnable(plugin)
	for k, v in pairs(VimPlugins) do
		if v == plugin then return true end
	end
	return false
end

----------------------------------------
-- vim original plugin
----------------------------------------
vim.cmd('packadd cfilter')

----------------------------------------
-- Define load plugin
----------------------------------------
-- plug('vim-lucius')
plug('iceberg.vim')
plug('glog.vim')
plug('nvim/gr.vim')
plug('unmemorable.vim')
plug('popupmarks.vim')
plug('minfy.vim')
plug('stline.vim')
plug('winbuf.vim')
plug('filefinder.vim')
plug('gitsigns.nvim')
plug('mason.nvim')

----------------------------------------
-- Define plugin loading configuration
----------------------------------------
local function load_config()
	-- jonathanfilip/vim-lucius
	if IsEnable('vim-lucius') then
		vim.cmd('colorscheme lucius')
		vim.cmd('highlight Search ctermbg=222 ctermfg=0 guibg=moccasin guifg=#484848')
	end

	-- cocoon/iceberg.vim
	if IsEnable('iceberg.vim') then
		vim.cmd('colorscheme iceberg')
		vim.opt.background = "dark"
	end

	-- atsumori123/stline.vim
	if IsEnable('stline.vim') then
--		vim.g.stline_theme = 'monochrome'
		vim.g.stline_theme = 'iceberg'
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
	if IsEnable('nvim/gr.vim') then
		require('gr').setup({grepprg = "grep"})
		map('n', '<leader>g', ':Gr<CR>', opts)
		map('v', '<leader>g', ':Gr<CR>', opts)
	end

	-- atsumori123/unmemorable.vim
	if IsEnable('unmemorable.vim') then
		map('n', '<leader>t', ':Unmemorable<CR>', opts)
		map('v', '<leader>t', ':Unmemorable<CR>', opts)
	end

	-- atsumori123/winbuf.vim
	if IsEnable('winbuf.vim') then
		map('n', '<leader>b', '<Plug>(wb-buffer-list)<CR>', opts)
		map('n', 'q', '<Plug>(wb-buffer-close)<CR>', opts)
		map('n', '<C-q>', '<Plug>(wb-buffer-close_all)<CR>', opts)
		map('n', '<C-l>', '<Plug>(wb-next-buffer)<CR>', opts)
		map('n', '<C-h>', '<Plug>(wb-prev-buffer)<CR>', opts)
		map('n', '<TAB>', '<Plug>(wb-next-window)<CR>', opts)
		map('n', '<S-TAB>', '<Plug>(wb-prev-window)<CR>', opts)
		map('n', '@', '<Plug>(wb-special-window)<CR>', opts)
		map('n', '<C-w>s', '<Plug>(wb-resize-window)<CR>', opts)
		map('n', '<C-t>', '<Plug>(wb-toggle-terminal)<CR>', opts)
		map('t', '<C-t>', '<Plug>(wb-toggle-terminal)<CR>', opts)
		map('n', '<C-p>', '<Plug>(wb-toggle-preview)<CR>', opts)
		map('n', 'f', '<Plug>(wb-easymotion)<CR>', opts)
		map('n', '<F3>', '<Plug>(wb-taglist)<CR>', opts)
		map('n', '<leader>q', '<Plug>(wb-toggle-quickfix)<CR>', opts)
		vim.g.winbuf_taglist_enable = 1
		vim.g.winbuf_easymotion_enable = 1
		vim.g.winbuf_switch_all_window = 1
		vim.g.winbuf_shell_type = vim.o.shell
	end

	-- atsumori123/minfy.vim
	if IsEnable('minfy.vim') then
		map('n', '\\', ':execute "Minfy ".expand("%:p:h")<CR>', opts)
	end

	-- atsumori123/popupmarks.vim
	if IsEnable('popupmarks.vim') then
		map('n', '<leader>m', ':OpenMarks<CR>', opts)
		map('n', 'ma', ':EditMarks Add<CR>', opts)
		map('n', 'md', ':EditMarks Del<CR>', opts)
		map('n', 'me', ':EditMarks Edit<CR>', opts)
	end

	-- atsumori123/filefinder.vim
	if IsEnable('filefinder.vim') then
		map('n', '<C-e>', ':FF<CR>', opts)
		map('n', '<leader>l', ':OL<CR>', opts)
	end

	-- atsumori123/glog.vim
	if IsEnable('glog.vim') then
		vim.g.gsign_disable = 1
	end

	-- lewis6991/gitsigns.nvim
	if IsEnable('gitsigns.nvim') then
		require('gitsigns').setup()
	end

	-- williamboman/mason.nvim
	if IsEnable('mason.nvim') then
		require("mason").setup()
	end

	-- neovim/nvim-lspconfig
	if IsEnable('nvim-lspconfig') then
		local lspconfig = require("lspconfig")
		lspconfig.clangd.setup({})
		vim.diagnostic.disable()
	end

	-- replace
	map('n', '<leader>r', ':<C-u>source ~/vimplugins/scripts.vim/replace.vim<CR>:call Replace("n")<CR>', opts)
	map('x', '<leader>r', ':<C-u>source ~/vimplugins/scripts.vim/replace.vim<CR>:call Replace("v")<CR>', opts)
end

----------------------------------------
-- Define plugin lazy setup
----------------------------------------
local lazy_setup = function()
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
