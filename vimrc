"""""""""""""""""""""""""""""" VIM """"""""""""""""""""""""""""""""""""""
"
"  Owner: syi
"  Data:
"  Credits: spf13-vim, vgod, etc
"  Basic idea of this vimrc is KISS
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

silent function! OSX()
    return has('macunix')
endfunction

silent function! LINUX()
    return has('unix') && !has('macunix') && !has('win32unix')
endfunction

silent function! WINDOWS()
    return  (has('win16') || has('win32') || has('win64'))
endfunction

let g:hostname = substitute(system('hostname'), '\n', '', '')


if filereadable(expand("~/.vimrc.plugins"))
    source ~/.vimrc.plugins
endif

if filereadable(expand("~/.vimrc.plugins.config"))
    source ~/.vimrc.plugins.config
endif







"""""""""""" General """""""""""

" global variables {


" }"

syntax on                   " Syntax highlighting
set synmaxcol=128 " limit the syntax highlight num
set mouse=a                 " Automatically enable mouse usage
set mousehide               " Hide the mouse cursor while typing
" Encode {

" }"
scriptencoding utf-8

" Editor {

set nu                          " Line numbers on

map <leader>e :e! ~/.vimrc<cr>  " Fast editing of the .vimrc
autocmd! bufwritepost .vimrc source ~/.vimrc " autoload vimrc when editing " Autoload vimrc when edited
nmap <leader>w :w!<cr> " Fast save






set backspace=indent,eol,start  " Backspace for dummies
set linespace=0                 " No extra spaces between rows
set showmatch                   " Show matching brackets/parenthesis
set winminheight=0              " Windows can be 0 line high
set wildmenu                    " Show list instead of just completing
set wildmode=list:longest,full  " Command <Tab> completion, list matches, then longest common part, then all.
set whichwrap=b,s,h,l,<,>,[,]   " Backspace and cursor keys wrap too
set scrolljump=5                " Lines to scroll when cursor leaves screen
set scrolloff=3                 " Minimum lines to keep above and below cursor

""set foldenable                  " Auto fold code

set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace

set nowrap                      " Do not wrap long lines

set autoindent                  " Indent at the same level of the previous line
set shiftwidth=4                " Use indents of 4 spaces
set expandtab                   " Tabs are spaces, not tabs
set tabstop=4                   " An indentation every four columns
set softtabstop=4               " Let backspace delete indent
set smartindent

""set nojoinspaces                " Prevents inserting two spaces after punctuation on a join (J)

set splitright                  " Puts new vsplit windows to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current

"_sound_"
set noerrorbells  " No sound on errors 
set novisualbell

"_search_"
set incsearch                   " Find as you type search
set hlsearch                    " Highlight search terms
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present



"}"


" Editing {

    set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
    set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
    set virtualedit=onemore             " Allow for cursor beyond last character
    set history=1000                    " Store a ton of history (default is 20)
    set spell                           " Spell checking on
    set iskeyword-=.                    " '.' is an end of word designator
    set iskeyword-=#                    " '#' is an end of word designator
    set iskeyword-=-                    " '-' is an end of word designator

    if has('clipboard')
        if has('unnamedplus')  " When possible use + register for copy-paste
            set clipboard=unnamed,unnamedplus
        else         " On mac and Windows, use * register for copy-paste
            set clipboard=unnamed
        endif
    endif

" }


" Key (re)Mappings {

let g:mapleader="," " Replace the '\' by ','

" Easier moving in tabs and windows
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_


" Code folding options
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


" Shortcuts
" Change Working Directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

" Map <Leader>ff to display all lines with keyword under cursor
" and ask which one to jump to
nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>

" Find merge conflict markers
map <leader>fc /\v^[<\|=>]{7}( .*\|$)<CR>

" }

"____ back up ____"
set backup
if has('persistent_undo')
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

"____ statusline ____"
