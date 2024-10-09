local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local bufopts = { noremap=true, silent=true, buffer=bufnr }

-- jj = <ESC>
map('i', 'jj', '<ESC>', opts)
map('i', '<C-j>', '<ESC>', opts)
-- ESCキー2回でハイライトoff
map('n', '<ESC><ESC>', ':<C-u>set nohlsearch!<CR>', opts)
-- INSERTモード中のカーソル移動
map('i', '<c-b>', '<Left>', opts)
map('i', '<c-j>', '<Down>', opts)
map('i', '<c-k>', '<Up>', opts)
map('i', '<c-l>', '<Right>', opts)
-- 'q'による記録を無効
map('', 'q', '<nop>', opts)
--カーソルの後ろにペースト後、カーソルをペースト開始時の位置に戻す
map('n', '<leader>p', 'P`[', opts)
-- 削除のみ
map('v', 'd', '"_d', opts)
map('n', 'd', '"_d', opts)
map('v', 'D', '"_D', opts)
map('n', 'D', '"_D', opts)
map('n', 'x', '"_x', opts)
map('v', 's', '"_s', opts)
map('n', 's', '"_s', opts)
map('v', 'S', '"_S', opts)
map('n', 'S', '"_S', opts)
-- 折り返し時に表示行単位での移動できるようにする
map('n', 'j', 'gj', opts)
map('n', 'k', 'gk', opts)
-- 改行削除
map('n', '<leader>d', 'J', opts)
-- 行頭/行末に移動
map('', '<S-h>', '0', opts)
map('', '<S-l>', '$', opts)
-- redo
map('n', 'U', '<C-r>', opts)
-- 最後に編集した箇所に移動
map('n', '<leader>e', '`.', opts)
-- 次のジャンプ箇所へ移動
map('n', '<c-l>', '<c-i>', opts)
-- Tabキーでウィンドウ切り替え
map('n', '<Tab>', '<C-W>w', opts)
map('n', '<S-Tab>', '<C-W>W', opts)
-- ノーマルモードで改行を有効にする
map('n', '<CR>', 'i<CR><ESC>', opts)
-- ノーマルモードでもBSキーで文字削除
map('n', '<BS>', 'i<BS><ESC>l', opts)
-- キー操作記録開始
map('n', '<F12>', 'qt', opts)
-- 再生
map('n', '<S-F12>', '@t', opts)
-- 全て選択
map('n', '<leader>a', 'ggVG', opts)
-- 次/前の差分へ
map('n', '<C-j>', ']c', opts)
map('n', '<C-k>', '[c', opts)
-- 文字サイズ変更
map('n', '<C-UP>', [[:let &guifont=substitute(&guifont,'\d\+$','\=submatch(0)+1','')<CR>]], bufopts)
map('n', '<C-DOWN>', [[:let &guifont=substitute(&guifont,'\d\+$','\=submatch(0)-1','')<CR>]], bufopts)
-- 検索開始でカーソルを次の候補に移動させない
map('n', '*', [[:let @/ = '\<' . expand('<cword>') . '\>'<CR>:set hlsearch<CR>:call histadd("/", @/)<CR>]], bufopts)
map('n', 'g*', [[:let @/ = expand('<cword>')<CR>:set hlsearch<CR>:call histadd("/", @/)<CR>]], bufopts)
-- バッファ同士でDiff
map('n', '<F10>', [[:execute('if &diff | diffoff! | else | diffthis | endif')<CR>]], opts)
-- If there are multiple declaration sources in tag jump, select from the list
map('n', 't', 'g<C-]>', opts)
map('v', 't', [["zygv<ESC><ESC>:exe("tjump ".@z)<CR>]], opts)
-- Back tag jamp
map('n', 'T', '<C-t>', opts)
-- QuickFixウィンドウの表示/非表示
map('n', '<leader>q', [[:exe('let nr = winnr("$") | copen | if nr == winnr("$") | cclose | else | set modifiable | endif')<CR>]], opts)
