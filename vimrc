" GLOBAL
silent! call pathogen#runtime_append_all_bundles()
silent! call pathogen#helptags()

se nocompatible                                                     " no VI
se hidden                                                           " don't close hided buffers
se nobackup                                                         " no backup
se dir=/tmp,/var/tmp
se autoread

"se ruler                                                           " line/column number
se nu                                                               " line numbers
se vb                                                               " visual bell

syntax on
colo wombat

" EDITOR
se iskeyword=@,48-57,_,192-255                                      " russian symbols support

se ch=1                                                             " commands line height
se showcmd                                                          " show last command
se showmode                                                         " show current mode
se mousehide                                                        " hide mouse when entering text
se ttyfast

se foldmethod=indent
se autoindent
se smartindent
se smarttab

se incsearch
se hlsearch                                                         " don't hl previous search results
se showmatch                                                        " show search matches
se ignorecase
se smartcase
se gdefault

se scrolljump=3
se scrolloff=3

se enc=utf8

se wcm=<Tab>
se wildmenu                                                         " tab completion in files
se wildmode=list:longest

se wrap
se linebreak
se textwidth=120
se colorcolumn=120
se formatoptions=qrn1
"se formatoptions+=tca

" STATUSLINE
se statusline=                                                      " clear the statusline for when vimrc is reloaded
se statusline+=%2*[%n%H%M%R%W]%*\                                   " buffer number
se statusline+=%f\                                                  " file name
se statusline+=%h%m%r%w                                             " flags
se statusline+=[%{strlen(&ft)?&ft:'none'},                          " filetype
se statusline+=%{strlen(&fenc)?&fenc:&enc},                         " encoding
se statusline+=%{&fileformat}]                                      " file format
se statusline+=%{GitBranchInfoString()}                             " git info
se statusline+=%=                                                   " right align
se statusline+=%b,0x%-8B\                                           " current char
se statusline+=%-14.(%l,%c%V%)\ %<%P                                " offset

se laststatus=2

se bs=2
se ff=unix
se ffs=unix

se backspace=indent,eol,start
se lazyredraw                                                       " don't refresh screen on macros work
se formatprg=par                                                    " use PAR as prg formatter (gq)

inoremap jj <esc>

let mapleader=","
nnoremap <leader>w <C-w>v<C-w>l                                     " split vertical & move to it
nnoremap <leader>a :Ack 
nnoremap <leader>v V`]                                              " reselect pasted text
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<cr>                    " strip trailing whitespace
nnoremap <leader><space> :noh<cr>
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>                  " edit vim file

nmap <leader><up> [e
nmap <leader><down> ]e

vmap <leader><up> [egv
vmap <leader><down> ]egv

nmap <leader>l :set list!<cr>
nmap <leader>ew :e <C-R>=expand("%:p:h")."/"<cr>
nmap <leader>t :NERDTreeToggle<cr>

se listchars=tab:▸\ ,eol:¬

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

nnoremap j gj
nnoremap k gk

nnoremap <tab> %
vnoremap <tab> %

se tabstop=4
se shiftwidth=4
se expandtab
se softtabstop=4
se showtabline=0

" PLUGINS
let g:bufExplorerShowRelativePath=1
nmap <D-r> :BufExplorer<cr>

let NERDTreeHighlightCursorline=1
let NERDTreeWinPos='right'
let NERDTreeWinSize=60

nmap gb :bp<cr>
nmap gB :bn<cr>

nnoremap / /\v
vnoremap / /\v

inoremap <C-P> <esc>:call PhpDocSingle()<cr>i
nnoremap <C-P> :call PhpDocSingle()<cr>
vnoremap <C-P> :call PhpDocRange()<cr>

vmap < <gv
vmap > >gv

menu Encoding.koi8-r :e ++enc=koi8-r<cr>
menu Encoding.windows-1251 :e ++enc=cp1251<cr>
menu Encoding.utf-8 :e ++enc=utf8 <cr>

imap {<cr> {<cr>}<esc>O

filetype on
filetype plugin on
filetype indent on

au FocusLost * :wa
au BufWritePost .vimrc source $MYVIMRC

au FileType helpfile                setlocal nonumber
au Syntax   php,ruby,js             setlocal foldmethod=syntax foldlevel=1

au BufRead,BufNewFile *.phps        setlocal filetype=php
au BufRead,BufNewFile *.thtml       setlocal filetype=php
au BufRead,BufNewFile *.twig        setlocal filetype=jinja

au BufRead,BufNewFile *.class.php   setlocal tabstop=2 shiftwidth=2 softtabstop=2
au BufRead,BufNewFile *.jade        setlocal tabstop=2 shiftwidth=2 softtabstop=2
au BufRead,BufNewFile *.yml         setlocal tabstop=2 shiftwidth=2 softtabstop=2
au BufRead,BufNewFile *.feature     setlocal tabstop=2 shiftwidth=2 softtabstop=2

