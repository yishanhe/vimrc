"""""""""""""""""""""
"      VIM SYI      "
"""""""""""""""""""""


" BEGIN of NeoBundle config

if has('vim_starting')
	if &compatible
		set nocompatible                
  	endif
  	set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

"" My Bundles here:

" 完美vim中输入中文切换
NeoBundle 'CodeFalling/fcitx-vim-osx' 

" VIM Markdown support
NeoBundle 'godlygeek/tabular' 
NeoBundle 'drmingdrmer/vim-syntax-markdown'

" Code complete & snippets
NeoBundle 'ervandew/supertab'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'rdnetto/YCM-Generator'
NeoBundle 'SirVer/ultisnips'
NeoBundle 'honza/vim-snippets'

" Python
NeoBundle 'vim-scripts/indentpython.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'nvie/vim-flake8'


" File
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'jistr/vim-nerdtree-tabs'
" NeoBundle 'tpope/vim-fugitive'


" UI
NeoBundle 'vim-airline/vim-airline'

" Dash support
NeoBundle 'rizzatti/dash.vim'

" Wakatime
NeoBundle 'wakatime/vim-wakatime'

" Vimwiki
NeoBundle 'vimwiki/vimwiki'


call neobundle#end()

filetype plugin indent on

NeoBundleCheck  


"""""""""""""""""""""""""""
" End of NeoBundle Config "
"""""""""""""""""""""""""""

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


"""""""""""""""""""""""""""""""""""""
"" Package Configurations

" VIM Markdown
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_frontmatter=1


" YCM
let g:ycm_path_to_python_interpreter="/usr/local/bin/python"
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:ycm_confirm_extra_conf = ''


" ultisnip
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


let python_highlight_all=1
syntax on

" nerdtree
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

" ctrlp
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pdf
let g:ctrlp_custom_ignore = {
            \ 'dir':  '\.git$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

" vimwiki
let g:vimwikihome = '/Users/syi/Dropbox/'
let g:vimwiki_list = [{'path': g:vimwikihome.'yishanhe.github.com/_wiki/',
            \ 'syntax': 'markdown',
            \ 'ext': '.markdown',
            \ 'auto_toc': 1}]
