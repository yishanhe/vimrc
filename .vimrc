" Great thanks to gmarik & vgod 's vimrc

" encoding setting  {
set encoding=utf-8                                  
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gb2312,big5,latin1



" General {
autocmd! bufwritepost .vimrc source ~/.vimrc " autoload vimrc when editing
set nocompatible " be iMproved
set history=256 " keep 256 lines of command line history
filetype off " required by vundle
filetype plugin indent on " required by vundle 
set autowrite " writes on make/shell commands
set autoread " auto read when file is changed from outside
"set fdn=2 " auto fold depth
" Register
set clipboard+=unnamed
" Backup
set nowritebackup
set nobackup " no backupfile *~
" Visualization
set showmatch " match )&}
set showmode " show current mode
syntax on " syntax highlight on
set number " line number
set matchtime=5 " bracket blinking
set novisualbell
set noerrorbells
set ruler 
set showcmd
" Indent
set copyindent " copy previous indentation
" Undo
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=1000         " How many undos
set undoreload=10000        " number of lines to save for undo
" Match and search
set hlsearch " highlight search
set ignorecase
set smartcase 
set incsearch
" }
"
" Statusline {
set laststatus=2
set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \ 
set statusline+=\ \ \ [%{&ff}/%Y] 
set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\ 
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
"
" \ 'auto_export': 1,
" Vimwiki {
let g:vimwiki_list = [{'path': '/home/yish/yishanhe.github.com/_wiki_source/',
\ 'path_html': '/home/yish/yishanhe.github.com/wiki/',
\ 'template_path': '/home/yish/yishanhe.github.com/assets/vimwiki_include/template/',
\ 'template_default': 'united',
\ 'index': 'index',
\ 'ext': '.wiki',
\ 'syntax': 'default',
\ 'auto_export': 1,
\ 'template_ext': '.html'}]
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_camel_case = 0
" let g:vimwiki_html_header_numbering = 2
" let g:vimwiki_html_header_numbering_sym = '.'
let g:vimwiki_valid_html_tags='strong,em,del,blockquote,ins,code'
"let g:vimwiki_customwiki2html=$HOME.'/.vim/bundle/vimwiki/autoload/vimwiki/customwiki2html.sh'
let g:vimwiki_browsers = ['google-chrome']

map <leader>tl <Plug>VimwikiToggleListItem

" }
"
" Switch tabs {
nmap <C-N> :tabnext<CR>
nmap <C-P> :tabprevious<CR>
" }
" Buffer {
nmap <C-b>n  :bnext<CR>
nmap <C-b>p  :bprev<CR>
" }  
"
" vundle {
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" }
"
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
" Bundle 'greyblake/vim-preview.git'
" vim-scripts repos
Bundle 'taglist.vim'
Bundle 'SuperTab'
Bundle 'vimwiki'
Bundle 'winmanager'
Bundle 'bufexplorer.zip'
Bundle 'The-NERD-tree'
Bundle 'matrix.vim--Yang'
Bundle 'FencView.vim'
Bundle 'Conque-Shell'
Bundle 'Vimpress'
Bundle 'Markdown'
Bundle 'LaTeX-Suite-aka-Vim-LaTeX'
Bundle 'c.vim'
Bundle 'snipMate'
Bundle 'ctrlp.vim'

" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
" ...

"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" Plugins Configuration
" TagList {
let Tlist_File_Fold_Auto_Close=1
" }
"
" winmanager {
let g:defaultExplorer=0
let g:winManagerWindowLayout='BufExplorer,FileExplorer|TagList'
nmap wm :WMToggle<cr>
" }
"
" NERDtree {
let NERDTreeWinPos="right"
" automatic open it with vim starts up
" autocmd vimenter * if !argc() | NERDTree | endif
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
"hide pyc && others
let NERDTreeIgnore=['\.o$', '\~$', '\.pyc$']
" }
" Vimpress {
let VIMPRESS=[{'username':'yishanhe',
              \'password':'',
              \'blog_url':'http://blog.yishanhe.net/'
              \}]
" }
" LaTex Suite {
set grepprg=grep/-nH/$*
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_ViewRule_pdf='evince'
" }
