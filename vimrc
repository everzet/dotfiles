" GLOBAL
silent! call pathogen#runtime_append_all_bundles()
"silent! call pathogen#helptags()

" no VI
se nocompatible
" don't close buffers
se hidden
se nobackup
se dir=/tmp,/var/tmp
se autoread

" line numbers
se nu
" visual bell
se vb

syntax on
colo mustang

" russian symbols
se iskeyword=@,48-57,_,192-255

" commands line height
se ch=1
" show last cmd
se showcmd
" show current mode
se showmode
" hide mouse
se mousehide
se ttyfast

se foldmethod=indent
se autoindent
se smartindent
se smarttab

se incsearch
se hlsearch
se showmatch
se ignorecase
se smartcase
se gdefault

se scrolljump=3
se scrolloff=3

se tabstop=4
se shiftwidth=4
se expandtab
se softtabstop=4
se showtabline=0

se enc=utf8

se wcm=<Tab>
se wildmenu
se wildmode=list:longest

se wrap linebreak nolist
se textwidth=100
se colorcolumn=102
se formatoptions=qrn1

" use PAR as prg formatter (gq)
"se formatprg=par
"se formatoptions+=tca

" STATUSLINE
se statusline=                               " clear the statusline for when vimrc is reloaded
se statusline+=%2*[%n%H%M%R%W]%*\            " buffer number
se statusline+=%f\                           " file name
se statusline+=%h%m%r%w                      " flags
se statusline+=[%{strlen(&ft)?&ft:'none'},   " filetype
se statusline+=%{strlen(&fenc)?&fenc:&enc},  " encoding
se statusline+=%{&fileformat}]               " file format
se statusline+=%{GitBranchInfoString()}      " git info
se statusline+=%=                            " right align
se statusline+=%b,0x%-8B\                    " current char
se statusline+=%-14.(%l,%c%V%)\ %<%P         " offset

se laststatus=2

se bs=2
se ff=unix
se ffs=unix
se backspace=indent,eol,start

inoremap jj <esc>

let mapleader=","

se listchars=tab:▸\ ,eol:¬
nnoremap <leader>a :Ack 
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader><space> :noh<cr>
nmap <leader>t :NERDTreeToggle<cr>
nmap <leader>l :set list!<cr>

" lines moving
nmap <S-up> [e
nmap <S-down> ]e
vmap <S-up> [egv
vmap <S-down> ]egv

" paths opening
nmap <leader>ep :e <C-R>=expand("%:p:h")."/"<cr>
nmap <leader>sp :vsp <C-R>=expand("%:p:h")."/"<cr>
nmap <leader>se :Vex<cr><C-w>=

" fugitive
nmap <leader>ga     :Gwrite<cr>
nmap <leader>gmo    :Gmove<cr>
nmap <leader>gre    :Gremove<cr>
nmap <leader>gs     :Gstatus<cr>
nmap <leader>gc     :Gcommit<cr>

" windows
nmap <leader>we <C-w>v<C-w>l
nmap <leader>ws <C-w>s<C-w>j
nmap <leader>wo :on<cr>
nmap <leader>w= <C-w>=
nmap <leader>w0 <C-w>\|
nmap <leader>w- <C-w>_
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" buffers
nmap <D-r> :BufExplorer<cr>
nmap <leader>bo :BufOnly<cr>
nmap gb :bp<cr>
nmap gB :bn<cr>

" spacing
nmap <leader>= :Tab /=<cr>
nmap <leader><leader> :Tab /,<cr>
nmap <silent> <leader>c :call <SID>StripTrailingWhitespaces()<cr>

" disable arrow keys
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

" PLUGINS
let g:bufExplorerShowRelativePath=1
let NERDTreeHighlightCursorline=1
let NERDTreeWinPos='right'
let NERDTreeWinSize=60

nnoremap / /\v
vnoremap / /\v

inoremap <C-P> <esc>:call PhpDocSingle()<cr>i
nnoremap <C-P> :call PhpDocSingle()<cr>
vnoremap <C-P> :call PhpDocRange()<cr>

vmap < <gv
vmap > >gv

menu Encoding.windows-1251 :e ++enc=cp1251<cr>
menu Encoding.utf-8 :e ++enc=utf8 <cr>

imap {<cr> {<cr>}<esc>O

filetype on
filetype plugin on
filetype indent on

if has('autocmd')
    au FocusLost silent! :wa
    au BufWritePost .vimrc source $MYVIMRC

    au FileType helpfile                setlocal nonumber
    au Syntax   php,ruby,js             setlocal foldmethod=syntax foldlevel=1

    au BufRead,BufNewFile *.phps        setlocal filetype=php
    au BufRead,BufNewFile *.thtml       setlocal filetype=php
    au BufRead,BufNewFile *.twig        setlocal filetype=jinja
    au BufRead,BufNewFile *.html.twig   setlocal filetype=html

    au BufRead,BufNewFile *.class.php   setlocal tabstop=2 shiftwidth=2 softtabstop=2
    au BufRead,BufNewFile *.jade        setlocal tabstop=2 shiftwidth=2 softtabstop=2
    au BufRead,BufNewFile *.yml         setlocal tabstop=2 shiftwidth=2 softtabstop=2
    au BufRead,BufNewFile *.feature     setlocal tabstop=2 shiftwidth=2 softtabstop=2
endif

function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

