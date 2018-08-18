" 挙動を vi 互換ではなく、Vim のデフォルト設定にする => .vimrcが存在すれば自動的に有効化されるので設定不要
" set nocompatible

" 一旦ファイルタイプ関連を無効化する
" filetype off

""""""""""""""""""""""""""""""
" プラグインのセットアップ
""""""""""""""""""""""""""""""
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})

" ファイルオープンを便利に
call dein#add('Shougo/unite.vim')
" ファイルをtree表示してくれる
call dein#add('scrooloose/nerdtree')
" タブの使用時に使いやすくする
" call dein#add('jistr/vim-nerdtree-tabs')

" Gitを便利に使う
call dein#add('tpope/vim-fugitive')

" Ruby向けにendを自動挿入してくれる
call dein#add('tpope/vim-endwise')

" インデントに色を付けて見やすくする
call dein#add('nathanaelkane/vim-indent-guides')
" 行末の半角スペースを可視化
call dein#add('bronson/vim-trailing-whitespace')

" ステータスラインの見た目を綺麗にする
call dein#add('itchyny/lightline.vim')

" solarizedのカラースキーマ
" call dein#add('altercation/vim-colors-solarized')

" ファイル検索を便利にする
call dein#add('ctrlpvim/ctrlp.vim')

" ヤンクの履歴を使用するのを便利にする
call dein#add('LeafCage/yankround.vim')

" URLを開けるようにする
call dein#add('tyru/open-browser.vim')

call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

""""""""""""""""""""""""""""""
" 各種オプションの設定
""""""""""""""""""""""""""""""
" スワップファイルは使わない(ときどき面倒な警告が出るだけで役に立ったことがない)
set noswapfile
" カーソルが何行目の何列目に置かれているかを表示する
set ruler
" コマンドラインに使われる画面上の行数
set cmdheight=2
" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2
" ステータス行に表示させる情報の指定(どこからかコピペしたので細かい意味はわかっていない)
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
" ステータス行に現在のgitブランチを表示する
set statusline+=%{fugitive#statusline()}
" ウインドウのタイトルバーにファイルのパス情報等を表示する
set title
" インデントに色が付いているのが分かるように、暗い背景色に合わせた配色にする
set background=dark
" タブ入力を複数の空白入力に置き換える
set expandtab
" 行番号を表示する
set number
" 対応する括弧やブレースを表示する
set showmatch
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" タブ文字の表示幅
set tabstop=2
" Vimが挿入するインデントの幅
set shiftwidth=2
" カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]
" Vimでファイルを開いた時に既に入力されている文字がdeleteできなくなったため設定
set backspace=indent,eol,start
" ヤンクしたらクリップボードにコピー
set clipboard+=unnamed
" 縦に分割した時に右側にファイルを開くようにする
set splitright
" 検索結果をハイライト表示する
set hlsearch
" 検索ワードの最初の文字を入力した時点で検索を開始する
set incsearch

" 構文ごとに文字色を変化させる
" syntax on
syntax enable
" カラースキーマの指定
" colorscheme solarized
colorscheme desert

" 行番号の色
highlight LineNr ctermfg=darkyellow

" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow

" lightlineのカラースキーマ
let g:lightline = {
      \ 'colorscheme': 'wombat'
      \ }

""""""""""""""""""""""""""""""

" vimを立ち上げた時に自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1

" open-browser.vim
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

" NERDTreeで隠しファイルが表示されるようにする
let NERDTreeShowHidden=1

" ctrlpで隠しファイルを検索対象にする
let g:ctrlp_show_hidden = 1

" vimファイルを開いた時にtreeを表示
" autocmd VimEnter * execute 'NERDTree'

" タブを開いた時にtreeを表示させる
" let g:nerdtree_tabs_open_on_console_startup = 1

" treeの幅
" let g:NERDTreeWinSize = 22

"""""""""""""""""""""""""
" NERDTreeの設定
"""""""""""""""""""""""""
" NERDTreeの開閉
nnoremap <silent><C-e> :NERDTreeToggle<CR>

"""""""""""""""""""""""""
" Unite.vimの設定
"""""""""""""""""""""""""
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

"""""""""""""""""""""""""
" yankroundの設定
"""""""""""""""""""""""""
" READMEに記載されていた基本設定
" ctrlpのキーマッピングと衝突するのでコメントアウト
" 代わりに自分でコマンドを追加

" nmap p <Plug>(yankround-p)
" xmap p <Plug>(yankround-p)
" nmap P <Plug>(yankround-P)
" nmap gp <Plug>(yankround-gp)
" xmap gp <Plug>(yankround-gp)
" nmap gP <Plug>(yankround-gP)
" nmap <C-p> <Plug>(yankround-prev)
" nmap <C-n> <Plug>(yankround-next)

nnoremap <leader>y :<C-u>Unite yankround<CR>

"""""""""""""""""""""""""
" 自動的に閉じ括弧を入力
"""""""""""""""""""""""""
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>

"""""""""""""""""""""""""
" その他
"""""""""""""""""""""""""
" filetypeの自動検出(最後の方に書いた方がいいらしい)
" filetype on
