local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local VimPluginsPath = vim.env.HOME..[[\vimplugins]]

----------------------------------------
-- Define load plugin
----------------------------------------
VimPlugins = {
			'vim-lucius',
			'taglist.vim',
			'stline.vim',
			'gr.vim',
			'cmemo.vim',
			'oldfiles.vim',
			'buffer.vim',
			'minfy.vim',
			'vim-easymotion',
			'vim-fugitive',
			'vim-visual-star-search',
			'diffview.nvim',
}
--			'ddc-around',
--			'ddc-matcher_head',
--			'ddc.vim',

local function Enabled(plugin)
	for k, v in pairs(VimPlugins) do
		if v == plugin then return true end
	end
	return false
end

----------------------------------------
-- Define plugin loading configuration
----------------------------------------
local function load_config()
	-- jonathanfilip/vim-lucius
	if Enabled('vim-lucius') then
		vim.cmd('colorscheme lucius')
	end

	-- cocopon/iceberg.vim
	if Enabled('iceberg.vim') then
		vim.cmd('colorscheme iceberg')
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
		vim.g.GR_Grep_Proc = 'vim'
	end

	-- atsumori123/cmemo.vim
	if Enabled('cmemo.vim') then
		map('n', '<leader>t', ':CMemo<CR>', opts)
	end

	-- atsumori123/oldfiles.vim
	if Enabled('oldfiles.vim') then
		map('n', '<leader>l', ':OL<CR>', opts)
	end

	-- atsumori123/buffer.vim
	if Enabled('buffer.vim') then
		map('n', '<leader>b', ':BF b<CR>', opts)
		map('n', '<leader>m', ':BF m<CR>', opts)
		map('n', '<leader>x', ':BF c<CR>', opts)
		map('n', '<S-j>', ':BN<CR>', opts)
		map('n', '<S-k>', ':BP<CR>', opts)
		map('n', 'zc', ':ZC<CR>', opts)
		map('n', '<leader>r', ':Replace<CR>', opts)
	end

	-- atsumori123/minfy.vim
	if Enabled('minfy.vim') then
		map('n', '<c-e>', ':execute "Minfy ".expand("%:p:h")<CR>', opts)
		vim.g.Minfy_use_easymotion = 0
	end

	-- vim-EasyMotionTarget
	if Enabled('vim-easymotion') then
		vim.g.EasyMotion_do_mapping = 0
		vim.g.EasyMotion_smartcase = 1
		vim.g.EasyMotion_use_migemo = 1
		vim.g.EasyMotion_use_upper = 1
		vim.g.EasyMotion_keys='hklyuiopnm,qwertzxcvbasdgjf'
		map('n', 'f', '<Plug>(easymotion-bd-f)', opts)
		map('n', 'F', '<Plug>(easymotion-overwin-f)', opts)
	end

	-- test
	map('n', '<leader>[', ':source ~/vimfiles/script/test.vim<CR>', opts)
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
	local path = VimPluginsPath .. '\\' .. plugin
	vim.fn.execute('set runtimepath+=' .. path)
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
