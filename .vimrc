"#####表示設定#####
set wildmenu " コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
set number "行番号を表示する
set expandtab "挿入モードで を挿入するとき、代わりに適切な数の空白を使う。
set hlsearch "前回の検索パターンが存在するとき、それにマッチするテキストを全て強調表示する。
set laststatus=2 "最下ウィンドウにいつステータス行が表示されるかを設定する。 常に表示
set autoindent "新しい行を開始したとき、新しい行のインデントを現在行と同じくする。
set showcmd "コマンド (の一部) を画面の最下行に表示する。
set backspace=indent,eol,start "挿入モードでの <BS>, <Del>, CTRL-W, CTRL-U がバックスペースの働く対象を定めている。
inoremap <silent> jj <ESC>
set title "編集中のファイル名を表示
set showmatch "括弧入力時の対応する括弧を表示
syntax on "コードの色分け
set tabstop=2 "インデントをスペース4つ分に設定
set smartindent "オートインデント
set shiftwidth=2
"#####検索設定#####
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る
set incsearch "検索コマンドを打ち込んでいる間にも、打ち込んだところまでのパターンがマッチするテキストを、すぐに表示する。
set pumheight=10
syntax enable
colorscheme industry
""""""""""""""""""""""""""""""
" 自動的に閉じ括弧を入力
""""""""""""""""""""""""""""""
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
""""""""""""""""""""""""""""""
" プラグインのセットアップ
""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" ファイルオープンを便利に
Plug 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
Plug 'Shougo/neomru.vim'
" コメントON/OFFを手軽に実行
Plug 'tomtom/tcomment_vim'
" シングルクオートとダブルクオートの入れ替え等
Plug 'tpope/vim-surround'
" ファイルをtree表示してくれる
Plug 'scrooloose/nerdtree'
""""""""""""""""""""""""""""""
" Unit.vimの設定
""""""""""""""""""""""""""""""
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
noremap <C-P> :Unite buffer<CR>
" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>
call plug#end()
""""""""""""""""""""""""""""""
