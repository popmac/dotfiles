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
call dein#add('jistr/vim-nerdtree-tabs')

" Ruby向けにendを自動挿入してくれる
call dein#add('tpope/vim-endwise')

" インデントに色を付けて見やすくする
call dein#add('nathanaelkane/vim-indent-guides')
" 行末の半角スペースを可視化
call dein#add('bronson/vim-trailing-whitespace')

" solarizedのカラースキーマ
" call dein#add('altercation/vim-colors-solarized')

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
" カーソルが何行目の何列目に置かれているかを表示する
set ruler
" コマンドラインに使われる画面上の行数
set cmdheight=2
" エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
set laststatus=2
" ステータス行に表示させる情報の指定(どこからかコピペしたので細かい意味はわかっていない)
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P
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
" 縦に分割した時に右側にファイルを開くようにする
set splitright

" 構文ごとに文字色を変化させる
" syntax on
syntax enable
" カラースキーマの指定
" colorscheme solarized
colorscheme desert

" 行番号の色
highlight LineNr ctermfg=darkyellow

""""""""""""""""""""""""""""""

" vimを立ち上げた時に自動的にvim-indent-guidesをオンにする
let g:indent_guides_enable_on_vim_startup = 1

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
