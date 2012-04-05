"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  A personal dotvimrc file
"  Maitained by Yi Shanhe<yishanhe.hust@gmail.com>
"  Great thanks to gmarik & vgod 's vimrc
"  Homepage http://yishanhe.net/
"  updated 04/05/2012
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Detect the system
function! MySys()
    if has("win32")
	return "win32"
    elseif has("unix")
        return "unix"
    else
	return "mac"
    endif
endfunction

" VIM be iMproved
set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Win32
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for gvim.exe | win下的gvim设置
if MySys()=="win32"

    "start gvim maximized | 启动自动最大化
    if has("autocmd")
	au GUIEnter * simalt ~x
    endif

    " behave as mswin | 支持win快捷键
    source $VIMRUNTIME/mswin.vim
    behave mswin

	" Fast editing of the vimrc
	" _vimrc放在用户目录下
    map <leader>e :e! ~\_vimrc<cr>
    " Autoload vimrc when edited
	autocmd! bufwritepost _vimrc source ~\_vimrc " autoload vimrc when editing

	
    " win下编码设置 { 
		" 系统右键菜单(如果有LANGUAGE环境变量, 也需要一致)
		language messages zh_CN.utf-8  
		" 内部编码(命令行vim和gui的gvim)
		set encoding=utf-8
		set termencoding=cp936
		set langmenu=zh_CN.UTF-8
		" 对多种编码格式的识别(新建文本默认utf8)
		set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
		set fileencoding=utf-8
		" gvim中中文菜单
		source $VIMRUNTIME/delmenu.vim  
		source $VIMRUNTIME/menu.vim
	" }
	" set persistent undo
	set undodir=C:\Windows\Temp

endif " end setting for gvim.exe

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Unix
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if MySys()=="unix"
	" Fast editing of the .vimrc
	map <leader>e :e! ~/.vimrc<cr>
	" Autoload vimrc when edited
	autocmd! bufwritepost .vimrc source ~/.vimrc " autoload vimrc when editing
	" set persistent undo
	set undodir=~/.vim/undodir
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Set persistent undo
set undofile


" Replace the '\' by ','
" let mapleader=","
" let g:mapleader=","

" Fast save
nmap <leader>w :w!<cr>

" Keep lines of command line history
set history=512 

" Filetype
filetype off " required by vundle
filetype plugin indent on " required by vundle 

" Auto write and read
set autowrite " writes on make/shell commands
set autoread " auto read when file is changed from outside

" Turn on wildmenu
set wildmode=longest:full
set wildmenu

" Register
set clipboard+=unnamed

" Backup
set nowritebackup
set nobackup " no backupfile *~
set nowb
set noswapfile

" Visualization
set showmatch " show match )&}
set showmode " show current mode
syntax on " syntax highlight on
set number " show line number
set matchtime=5 " bracket blinking
set ruler 
set showcmd

" Table
set tabstop=4
set shiftwidth=4

" No sound on errors 
set noerrorbells
set novisualbell

" Indent
set copyindent " copy previous indentation

" Match and search
set hlsearch " highlight search
set ignorecase " ignore case when searching
set smartcase 
set incsearch

" Statusline { 
set laststatus=2
set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \ 
set statusline+=\ \ \ [%{&ff}/%Y] 
set statusline+=\ \ \ %<%20.40(%{hostname()}:%{CurDir()}%)\ 
set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L

function! CurDir()
    let curdir = substitute(getcwd(), $HOME, "~", "")
    return curdir
endfunction

function! HasPaste()
    if &paste
        return '[PASTE]'
    else
        return ''
    endif
endfunction

" }

" Switch tabs {

nmap <C-N> :tabnext<CR>
nmap <C-P> :tabprevious<CR>

" Tab configuration
map <leader>tn :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" }
" Buffer {
nmap <C-b>n  :bnext<CR>
nmap <C-b>p  :bprev<CR>
" }  
"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle               vim script plugins manager
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set rtp+=~\.vim\bundle\vundle

call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
" Bundle 'tpope/vim-fugitive'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'SuperTab'
Bundle 'vimwiki'
Bundle 'winmanager'
Bundle 'bufexplorer.zip'
Bundle 'The-NERD-tree'
Bundle 'matrix.vim--Yang'
Bundle 'FencView.vim'
Bundle 'Conque-Shell'
Bundle 'Markdown'
Bundle 'LaTeX-Suite-aka-Vim-LaTeX'
Bundle 'c.vim'
Bundle 'snipMate'
Bundle 'minibufexpl.vim'
Bundle 'taglist.vim'

" non github repos
" Bundle 'git://git.wincent.com/command-t.git'

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" TagList {
let Tlist_File_Fold_Auto_Close=1
" }

" winmanager {
let g:defaultExplorer=0
let g:winManagerWindowLayout='BufExplorer,FileExplorer|TagList'
nmap wm :WMToggle<cr>
" }

" NERDtree {
let NERDTreeWinPos="right"
" automatic open it with vim starts up
" autocmd vimenter * if !argc() | NERDTree | endif
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"hide pyc && others
let NERDTreeIgnore=['\.o$', '\~$', '\.pyc$']
" }

" LaTex Suite {
set grepprg=grep/-nH/$*
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_ViewRule_pdf='evince'
" }

" bufExplorer plugin {
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
map <leader>o :BufExplorer<cr>
" }

" Minibuffer plugin {
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne = 2
let g:miniBufExplModSelTarget = 0
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplVSplit = 25
let g:miniBufExplSplitBelow=1
let g:bufExplorerSortBy = "name"
autocmd BufRead,BufNew :call UMiniBufExplorer
map <leader>u :TMiniBufExplorer<cr>
" }

" Vimwiki {
    
if MySys()=="win32"
	let g:vimwiki_list = [{'path': 'D:/yishanhe.github.com/_wiki_source/',
	\ 'path_html': 'D:/yishanhe.github.com/wiki/',
	\ 'template_path': 'D:/yishanhe.github.com/assets/vimwiki_include/template/',
	\ 'template_default': 'united',
	\ 'index': 'index',
	\ 'ext': '.wiki',
	\ 'syntax': 'default',
	\ 'auto_export': 1,
	\ 'template_ext': '.html'}]
elseif MySys()=="unix"
	let g:vimwiki_list = [{'path': '/home/yish/yishanhe.github.com/_wiki_source/',
	\ 'path_html': '/home/yish/yishanhe.github.com/wiki/',
	\ 'template_path': '/home/yish/yishanhe.github.com/assets/vimwiki_include/template/',
	\ 'template_default': 'united',
	\ 'index': 'index',
	\ 'ext': '.wiki',
	\ 'syntax': 'default',
	\ 'auto_export': 1,
	\ 'template_ext': '.html'}]
endif

let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_camel_case = 0
" let g:vimwiki_html_header_numbering = 2
" let g:vimwiki_html_header_numbering_sym = '.'
let g:vimwiki_valid_html_tags='strong,em,del,blockquote,ins,code'
" let g:vimwiki_customwiki2html=$HOME.'/.vim/bundle/vimwiki/autoload/vimwiki/customwiki2html.sh'
let g:vimwiki_browsers = ['google-chrome']
" todo toggler
map <leader>tl <Plug>VimwikiToggleListItem  
" }
