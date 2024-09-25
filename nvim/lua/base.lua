-- スペースキーにlieaderを割り当てる
vim.g.mapleader = ' '

-- -------------------------------------
--  Window
-- -------------------------------------
-- ファイルの文字コード
vim.opt.fileencoding = 'utf-8'
-- 自働認識するfileencordingリスト
vim.opt.fileencodings = {'utf-8', 'euc-jp', 'sjis', 'iso-2022-jp'}
-- バックアップの作成有無
vim.opt.backup = false
-- スワップファイルの作成有無
vim.opt.swapfile = false
-- 編集中のファイルが変更されたら自動で読み直す
vim.opt.autoread = true
-- バッファが編集中でもその他のファイルを開けるように
vim.opt.hidden = true
-- 入力中のコマンドをステータスに表示する
vim.opt.showcmd = true
-- カーソル上下に確保する表示行
vim.opt.scrolloff = 5
-- マウスを有効
vim.opt.mouse = 'a'
-- Harf-Width character size
--vim.opt.guifont = "cica:h9"
-- Double-byte character size
--vim.opt.guifontwide = "cica:h9"

-- -------------------------------------
--  Display
-- -------------------------------------
-- ヘルプファイル
vim.opt.helplang = 'ja','en'
-- 行番号を表示
vim.opt.number = true
-- タブ幅
vim.opt.tabstop = 4
-- インデント幅
vim.opt.shiftwidth = 4
-- 長い行の画面端での折り返し
vim.opt.wrap = false
-- ウィンドウのタイトルを表示
vim.opt.title = true
-- 現在の行を強調表示
vim.opt.cursorline = true
-- 現在の桁を強調表示
vim.opt.cursorcolumn = true
-- C言語風にインデント
vim.opt.smartindent = true
-- 括弧の連携
vim.opt.showmatch = true
-- 常にステータスラインを表示
vim.opt.laststatus = 2
--" コマンドラインの補完
vim.opt.wildmode = 'list:longest'
-- 行末の1文字先までカーソルを移動＋矩形選択中は行末に文字が無くてもカーソルを行末以降に移動させる
vim.opt.virtualedit = {'onemore', 'block'}
--" 全て大文字の変数の値をviminfoに記録する
--vim.opt.viminfo = true
-- 折り畳みを無効
vim.opt.foldenable = false
-- 不可視文字(tab,行末)の設定
vim.opt.list = false
-- 不可視文字に使う文字
vim.opt.listchars = {tab='|-', trail='_', nbsp='+'}
-- Unicode文字の不明瞭な文字幅
vim.opt.ambiwidth = 'double'
-- diff vertical
vim.opt.diffopt:append{'vertical'}
-- use gui color
vim.opt.termguicolors = true

-- -------------------------------------
--  Search
-- -------------------------------------
-- 検索するときに大文字小文字を区別しない
vim.opt.ignorecase = true
-- 小文字で検索すると大文字と小文字を無視して検索
vim.opt.smartcase = true
-- 検索パターン入力中にその文字を強調表示する
vim.opt.incsearch = true
-- 検索結果をハイライト表示
vim.opt.hlsearch = true
-- 検索がファイル末尾まで進んだら先頭から再建策
vim.opt.wrapscan = false

-- -------------------------------------
--  Operation
-- -------------------------------------
-- 補完設定(search from the loaded buffer)
vim.opt.complete:append{'b'}
-- ヤンクレジスタとクリップボードを連携する
vim.opt.clipboard = 'unnamed'
-- Tag file
vim.opt.tags = './tags;$HOME'

-- -------------------------------------
--  IME
-- -------------------------------------
--ノーマルモードに戻るときIMEをOFFにする
vim.cmd('autocmd InsertLeave * :call system("zenhan 0")')
vim.cmd('autocmd CmdlineLeave * :call system("zenhan 0")')
