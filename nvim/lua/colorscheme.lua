-- Underline the current line
vim.cmd('highlight CursorLine cterm=underline ctermfg=NONE ctermbg=NONE gui=underline guifg=NONE guibg=NONE')

-- フローティングウィンドウの背景色
vim.api.nvim_set_hl(0, 'NormalFloat', {ctermbg = 236, ctermfg = 251, bg = '#3d425b', fg = '#c6c8d1'})
-- フローティングウィンドウタイトルの背景色
vim.api.nvim_set_hl(0, 'FloatTitle', {ctermbg = 236, ctermfg = 251, bg = '#3d425b', fg = '#c6c8d1'})
