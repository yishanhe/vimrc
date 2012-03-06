source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" Great thanks to gmarik & vgod 's vimrc


 

" General {
autocmd! bufwritepost .vimrc source ~/.vimrc " autoload vimrc when editing
set nocompatible " be iMproved
set history=256 " keep 256 lines of command line history
filetype off " required by vundle
filetype plugin indent on " required by vundle 
set autowrite " writes on make/shell commands
set autoread " auto read when file is changed from outside
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
let g:vimwiki_list = [{'path': 'D:/yishanhe.github.com/_wiki_source/',
\ 'path_html': 'D:/yishanhe.github.com/assets/wiki_html/',
\ 'template_path': 'D:/yishanhe.github.com/assets/vimwiki_include/template/',
\ 'template_default': 'the-yish',
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
set rtp+=$HOME\.vim\bundle\vundle
call vundle#rc()
" }
"$VIMRUNTIME/vimrc_example.vim
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
              \'password':'easonherd',
              \'blog_url':'http://blog.yishanhe.net/'
              \}]
" }
" LaTex Suite {
set grepprg=grep/-nH/$*
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_ViewRule_pdf='evince'
" }

