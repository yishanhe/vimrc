"""""""""""""""""""""
"      VIM SYI      "
"""""""""""""""""""""


"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
filetype plugin indent on
syntax enable


" set window size
set lines=50 columns=100

" set mouse
set mouse=a
set mousehide

set history=500
let mapleader=","
set number


set scrolljump=5 " 滚动行数
set scrolloff=3 "光标距离顶部和底部行数

set tabstop=4 		" 一个tab相当于4个空格
set expandtab 		" 用tab时候，自动转成空格
set shiftwidth=4
set softtabstop=4
set autoindent
set showmatch 		" 各种括号配对高亮

set clipboard=unnamed " MacOS 系统剪切板
set encoding=utf-8

set wildmenu " 显示补全list
set wildmode=list:longest,full "Tab 补全command

autocmd! bufwritepost .vimrc source ~/.vimrc " 自动加载vimrc

" 快速保存
nmap <leader>w :w!<cr>

" sound
set noerrorbells
set novisualbell

" search 相关设置
set incsearch
set hlsearch
set ignorecase
set smartcase

" 清除高亮结果
nnoremap silent <esc> :noh<cr><esc>

" moving in tab and windows
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_

" 进入当前文件目录
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

" code folding option
nmap <leader>f0 :set foldlevel=0<CR>
nmap <leader>f1 :set foldlevel=1<CR>
nmap <leader>f2 :set foldlevel=2<CR>
nmap <leader>f3 :set foldlevel=3<CR>
nmap <leader>f4 :set foldlevel=4<CR>
nmap <leader>f5 :set foldlevel=5<CR>
nmap <leader>f6 :set foldlevel=6<CR>
nmap <leader>f7 :set foldlevel=7<CR>
nmap <leader>f8 :set foldlevel=8<CR>
nmap <leader>f9 :set foldlevel=9<CR>

