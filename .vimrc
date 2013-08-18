"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"  A personal dotvimrc file
"  Maitained by  Syi<syi@email.wm.edu>
"  Credits to gmarik, vgod and hotoo
"  Homepage http://yishanhe.net/
"  updated 05-28 2013
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" define computer name
let g:computername='mac'
" alternatives: macwin, lab

" Detect the system

if has("win32") || has("win32unix")
	let g:OS#name = "win"
    let g:OS#windows = 1
    let g:OS#mac = 0
    let g:OS#unix = 0
elseif has("unix")
	let s:uname = system("uname")
	if s:uname == "Darwin\n"
		let g:OS#name = "mac"
		let g:OS#unix = 0
		let g:OS#windows = 0
		let g:OS#mac = 1
	else
   		let g:OS#name = "unix"
    	let g:OS#unix = 1
    	let g:OS#windows = 0
    	let g:OS#mac = 0
	endif
endif
if has("gui_running")
    let g:OS#gui = 1
"    set go=aAce              " 去掉难看的工具栏和滑动条
"    set transparency=30      " 透明背景
"    set guifont=Monaco:h12   " 设置默认字体为monaco
    set showtabline=2        " 开启自带的tab栏
    set columns=140          " 设置宽
    set lines=40             " 设置长
else
    let g:OS#gui = 0
endif

" VIM be iMproved
set nocompatible

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Win32
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for gvim.exe | win下的gvim设置
if g:OS#windows

    "start gvim maximized | 启动自动最大化
    if has("autocmd")
	au GUIEnter * simalt ~x
    endif

    " behave as mswin | 支持win快捷键
    source $VIMRUNTIME/mswin.vim
    behave mswin
	
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

endif " end setting for gvim.exe


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" Encoding
set encoding=utf-8                                  
set termencoding=utf-8
set fileencoding=utf-8
"set fileencodings=ucs-bom,utf-8,chinese,gb2312,big5,latin1
"set language=zh_CN.utf-8

" set persistent undo
" set undodir=~/.vim/undodir
" set undofile



" 文件格式，默认 ffs=dos,unix
set fileformat=unix
set fileformats=unix,mac,dos

" set default(normal) window size.
" set columns=90
" set lines=30


" Replace the '\' by ','
let mapleader=","
let g:mapleader=","

" map ESC 
inoremap jj <ESC>
" map ` for '' in KCB poker
" inoremap '' ` 

" Fast editing of the .vimrc
map <leader>e :e! ~/.vimrc<cr>

" Autoload vimrc when edited
autocmd! bufwritepost .vimrc source ~/.vimrc " autoload vimrc when editing

" Fast save
nmap <leader>w :w!<cr>

" limit the syntax highlight num
set synmaxcol=128

" Scroll
"set ttyscroll=3
set scrolloff=3


" 设置宽度不明的文字(如 “”①②→ )为双宽度文本。
" @see http://blog.sina.com.cn/s/blog_46dac66f010006db.html
set ambiwidth=double

set lazyredraw

" Keep lines of command line history
set history=512 

" Filetype
filetype off " required by vundle
filetype plugin indent on " required by vundle 

" Auto write and read
set autowrite " writes on make/shell commands
set autoread " auto read when file is changed from outside


" Folds
set foldmethod=syntax
set foldlevel=6
set foldcolumn=0
"set fdn=2 " auto fold depth

" Turn on wildmenu
set wildmode=longest:full
set wildmenu

" Register
" set clipboard+=unnamed

" Backup
set nowritebackup
set nobackup " no backupfile *~
if g:OS#windows
	set directory=$VIM\tmp
else
	set directory=~/.tmp
endif
set nowb
set noswapfile

" Visualization
" colo desert
set showmatch " show match )&}
set showmode " show current mode
syntax on " syntax highlight on
set number " show line number
set matchtime=5 " bracket blinking
set ruler 
set showcmd

" Tabs
set softtabstop=4
set expandtab "replace tab to whitespace
set tabstop=4
set shiftwidth=4

" split
set splitright
" set splitbelo" split
set splitright
" set splitbeloww

" No sound on errors 
set noerrorbells
set novisualbell

" Indent
" set copyindent " copy previous indentation
set linebreak
set autoindent
set smartindent

" Match and search
set hlsearch " highlight search
set ignorecase " ignore case when searching
set smartcase 
set incsearch



" Switch tabs {
" tab navigation & operation like tabs browser
" @see http://vimcdoc.sourceforge.net/doc/tabpage.html
" Note: cannot map <C-number> for gvim on window 7.
imap <C-t> <Esc>:tabnew<cr>
nmap <C-t> :tabnew<cr>
"imap <C-w> <Esc>:tabclose<cr> " window shortcut key.
"nmap <C-w> :tabclose<cr>
"imap <C-S-w> <Esc>:tabonly<cr>
"nmap <C-S-w> :tabonly<cr>
imap <C-tab> :tabnext<cr>
nmap <C-tab> :tabnext<cr>
imap <C-S-tab> :tabprevious<cr>
nmap <C-S-tab> :tabprevious<cr>
if g:OS#mac
    imap <D-1> <Esc>:tabfirst<cr>
    nmap <D-1> :tabfirst<cr>
    imap <D-2> <Esc>2gt
    nmap <D-2> 2gt
    imap <D-3> <Esc>3gt
    nmap <D-3> 3gt
    imap <D-4> <Esc>4gt
    nmap <D-4> 4gt
    imap <D-5> <Esc>5gt
    nmap <D-5> 5gt
    imap <D-6> <Esc>6gt
    nmap <D-6> 6gt
    imap <D-7> <Esc>7gt
    nmap <D-7> 7gt
    imap <D-8> <Esc>8gt
    nmap <D-8> 8gt
    imap <D-9> <Esc>9gt
    nmap <D-9> 9gt
    imap <D-0> <Esc>:tablast<cr>
    nmap <D-0> :tablast<cr>
else
    imap <M-1> <Esc>:tabfirst<cr>
    nmap <M-1> :tabfirst<cr>
    imap <M-2> <Esc>2gt
    nmap <M-2> 2gt
    imap <M-3> <Esc>3gt
    nmap <M-3> 3gt
    imap <M-4> <Esc>4gt
    nmap <M-4> 4gt
    imap <M-5> <Esc>5gt
    nmap <M-5> 5gt
    imap <M-6> <Esc>6gt
    nmap <M-6> 6gt
    imap <M-7> <Esc>7gt
    nmap <M-7> 7gt
    imap <M-8> <Esc>8gt
    nmap <M-8> 8gt
    imap <M-9> <Esc>9gt
    nmap <M-9> 9gt
    imap <M-0> <Esc>:tablast<cr>
    nmap <M-0> :tablast<cr>
endif
" } 

"" Buffer {
"map <F3> :bnext<CR>
"map <F2> :bprev<CR>
"" }  

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" $ git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" Vundle               vim script plugins manager
" Vunlde on win needs git and curl. This dotvimrc also needs ctags.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Vundle
set rtp+=~/.vim/bundle/vundle/

call vundle#rc() " required

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
Bundle 'xml.vim'
Bundle 'vimwiki'
" Bundle 'winmanager'
" Bundle 'bufexplorer.zip'
" Bundle 'The-NERD-tree'
Bundle 'FencView.vim'
" Bundle 'Conque-Shell'
" Bundle 'Markdown'
" Bundle 'LaTeX-Suite-aka-Vim-LaTeX'
Bundle 'c.vim'
Bundle 'snipMate'
" Bundle 'minibufexpl.vim'
Bundle 'taglist.vim'
" Bundle 'calendar.vim'

" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
Bundle 'https://github.com/Lokaltog/vim-powerline.git'
" Bundle 'https://github.com/yishanhe/winmanager.git'

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

" Powerline {
" @see https://powerline.readthedocs.org/en/latest/
set laststatus=2
let g:Powerline_symbols = 'compatible'
let g:Powerline_cache_enabled = 0
set t_Co=256
"set guifont=PowerlineSymbols\ for\ Powerline
" }

" FencView {
let g:fencview_autodetect=1
let g:fencview_auto_patterns='*.txt,*.js,*.css,*.c,*.cpp,*.h,*.java,*.cs,*.htm{l\=}'
let g:fencview_checklines=20
let $FENCVIEW_TELLENC='tellenc'
" }


" TagList {
let Tlist_Show_One_File = 1            "只显示当前文件的taglist，默认是显示多个
let Tlist_Exit_OnlyWindow = 1          "如果taglist是最后一个窗口，则退出vim
"let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist
let Tlist_GainFocus_On_ToggleOpen = 1  "打开taglist时，光标保留在taglist窗口
let Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8/bin/ctags'  "设置ctags命令的位置
nmap tl :Tlist<cr>        
" }
" Ctags {
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>  
" }



"" winmanager {
"" add `exe 'q'` the file `winmanager.vim` line1064 `call s:StartWindowsManager()`		
"let g:defaultExplorer=0
"" let g:winManagerWindowLayout='BufExplorer,FileExplorer|TagList'
"let g:winManagerWindowLayout='NERDTree|TagList'
" TMiniBufExplorer
"nmap wm :WMToggle<cr>
"" }

"" NERDtree {
"let g:NERDTree_title="[NERDTree]"
"let NERDTreeWinPos="right"
"let NERDTreeIgnore=['\.o$', '\~$', '\.pyc$']
"" }

"" LaTex Suite {
"set grepprg=grep/-nH/$*
"let g:Tex_DefaultTargetFormat='pdf'
" let g:Tex_ViewRule_pdf='evince' " define the file viewer
"" }

"" bufExplorer plugin {
" let g:bufExplorerDefaultHelp=0
" let g:bufExplorerShowRelativePath=1
" map <leader>o :BufExplorer<cr>
"" }

"" Minibuffer plugin {
"let g:miniBufExplModSelTarget = 1
"let g:miniBufExplMoreThanOne = 0
"" let g:miniBufExplUseSingleClick = 1
"let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplMapWindowNavArrows = 1
"let g:miniBufExplMapCTabSwitchBufs = 1
"" let g:miniBufExplVSplit = 25
"" let g:miniBufExplSplitBelow=1
"let g:bufExplorerSortBy = "name"
"" autocmd BufRead,BufNew :call UMiniBufExplorer
"map <leader>u :TMiniBufExplorer<cr>
"" }

"" Rainbow-Parenthsis-Bundle {
" `rainbow_parenthesis.vim`
" add `let rainbow_parenthesis#active = 0`
" after line 66
" }
" Calendar {
" map <F8> :CalendarH<cr>
"" }

" Vimwiki {
if g:OS#windows
	let g:vimwikihome = 'C:\Users\yish\Documents\GitHub\'
elseif g:OS#unix
	let g:vimwikihome = '/scratch/syi.scratch/GitRepo/'
elseif g:OS#mac
	let g:vimwikihome = '/Users/shanheyi/'
endif 	

let g:vimwiki_list = [{'path': g:vimwikihome.'yishanhe.github.com/_vimwiki/',
	\ 'path_html': g:vimwikihome.'yishanhe.github.com/wiki/',
	\ 'template_path': g:vimwikihome.'yishanhe.github.com/assets/vimwiki_include/template/',
	\ 'template_default': 'united',
	\ 'index': 'index',
	\ 'ext': '.wiki',
	\ 'syntax': 'default',
	\ 'auto_export': 1,
	\ 'nested_syntaxes': {'python': 'python', 'cpp': 'cpp', 'c': 'c', 'java': 'java'},
	\ 'template_ext': '.html'}]

let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_camel_case = 0
let g:vimwiki_valid_html_tags='strong,em,del,blockquote,ins,code'
let g:vimwiki_browsers = ['google-chrome']
" todo toggler
map <leader>tl <Plug>VimwikiToggleListItem  
" }
