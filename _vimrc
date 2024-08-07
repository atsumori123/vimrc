" Map leader
let mapleader = "\<Space>"
" Plugins/Scripts
source $HOME/_vimrc_plugins

"--------------------------------
" base configure
"--------------------------------
" UTF-8化
set fenc=utf-8
" Automatic Character Encording
set encoding=utf-8
set fileencodings=utf-8,euc-jp,sjis,iso-2022-jp
" ファイルを上書きする前にバックアップを作ることを無効化
set nobackup
" スワップファイルを作成しない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" 画面端でのスクロールに余裕を持たす
set scrolloff=5
" マウスを有効
set mouse=a
" タイトルを表示
set title
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 現在の桁を強調表示
set cursorcolumn
" 行末の1文字先までカーソル移動可
set virtualedit=onemore
" 矩形選択中は行末に文字が無くてもカーソルを行末以降に移動させることが可能
set virtualedit+=block
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" 対応する括弧を強調表示
set showmatch
" 常にステータスラインを表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
" 長い行を画面端で折り返さない
set nowrap
" 全て大文字の変数の値をviminfoに記録する
set viminfo+=!
" 折り畳みを無効
set nofoldenable
" 不可視文字(tab,行末)の設定
"set nolist listchars=tab:\▸\-,trail:_
set nolist listchars=tab:\|\-,trail:_
" タブ幅
set tabstop=4
" インデント幅
set shiftwidth=4
" 全角文字の表示が崩れるのを防ぐ
set ambiwidth=double
" 検索するときに大文字小文字を区別しない
set ignorecase
" 小文字で検索すると大文字と小文字を無視して検索
set smartcase
" インクリメンタル検索 (検索ワードの最初の文字を入力した時点で検索が開始)
set incsearch
" 検索結果をハイライト表示
set hlsearch
" 検索がファイル末尾まで進んだらストップ
set nowrapscan
" 検索ヒット数を表示
set shortmess-=S
" 補完設定(search from the loaded buffer)
set complete=.,b
" Tag file
set tags=./tags;$HOME
" diff vertical
set diffopt+=vertical
" ヤンクレジスタとクリップボードを連携する
set clipboard+=unnamed
" インサートモード中の BS、CTRL-W、CTRL-U による文字削除を柔軟にする
set backspace=indent,eol,start

"--------------------------------
" keymap
"--------------------------------
" カーソル後ろにペースト後、カーソルをペースト開始時の位置に戻す
noremap \ P`[
" 削除のみ
vnoremap d "_d
nnoremap d "_d
vnoremap D "_D
nnoremap D "_D
vnoremap x "_x
nnoremap x "_x
vnoremap s "_s
nnoremap s "_s
" 切り取り
nnoremap m d
vnoremap m x
nnoremap mm dd
nnoremap M D
" 折り返し時に表示行単位での移動できるようにする
noremap <silent>j gj
noremap <silent>k gk
" 改行削除
noremap <leader>d J
" 行頭/行末に移動
noremap <S-h> 0
noremap <S-l> $
" redo
nnoremap U <C-r>
" 最後に編集した箇所に移動
noremap <END> '.
noremap <kEND> '.
" Tabキーでウィンドウ切り替え
noremap <Tab> <C-W>w
noremap <S-Tab> <C-W>W
" ノーマルモードで改行を有効にする
nnoremap <CR> i<CR><ESC>
" ノーマルモードでもBSキーで文字削除
noremap <BS> i<BS><ESC>l
" jj = <ESC>
inoremap <silent> jj <ESC>
" インサートモードからノーマルモードに戻るときIMEをオフにする
inoremap <ESC> <ESC>:set iminsert=0<CR>
" 記録終了のキーマップを無効
noremap q <nop>
" キー操作記録開始
nnoremap <F12> qt
" 再生
noremap <S-F12> @t
" 全て選択
nnoremap <leader>a ggVG
" 次/前の差分へ
nnoremap <C-j> ]c
nnoremap <C-k> [c
" If there are multiple declaration sources in tag jump, select from the list
nnoremap t :exe("tjump ".expand('<cword>'))<CR>
" Back tag jamp
nnoremap T <C-t>
" バッファ同士でDiff
nnoremap <silent><F10> :execute('if &diff \| diffoff! \| else \| diffthis \| endif')<CR>
" 文字サイズ変更
nnoremap <C-UP> :let &guifont=substitute(&guifont,'\d\+$','\=submatch(0)+1','')<CR>
nnoremap <C-DOWN> :let &guifont=substitute(&guifont,'\d\+$','\=submatch(0)-1','')<CR>
" ESCキー2回でハイライトoff
noremap <Esc><Esc> :nohlsearch<CR><Esc>
" 検索開始でカーソルを次の候補に移動させない
nnoremap <silent> * "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>:call histadd("/", '\<'.@z.'\>')<CR>
nnoremap <silent> g* "zyiw:let @/ =  @z<CR>:set hlsearch<CR>:call histadd("/", @z)<CR>
" QuickFixウィンドウの表示/非表示
nnoremap <silent><leader>q :execute('let nr = winnr("$") \| copen \| if nr == winnr("$") \| cclose \| else \| set modifiable \| endif')<CR>
" Open QuickFix window under vertical split
autocmd Filetype qf wincmd J
