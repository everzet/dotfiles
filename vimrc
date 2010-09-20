" GLOBAL
silent! call pathogen#runtime_append_all_bundles()

se nocompatible                                                     " no VI
se hidden                                                           " don't close hided buffers
se nobackup                                                         " no backup
se noswapfile                                                       " no swap

"se ruler                                                            " line/column number
se foldcolumn=1                                                     " fold column before line numbers
se nu                                                               " line numbers
se vb                                                               " visual bell

colo wombat 
syntax on

" GUI
if has("gui_running")
    se lines=65 columns=180
    se go-=r                                                        " no right scroll
    se go-=L                                                        " no left scroll
    se go-=T                                                        " no toolbar
    se guifont=ProFontX:h9
endif

" EDITOR
se iskeyword=@,48-57,_,192-255                                      " russian symbols support

se ch=1                                                             " commands line height
se showmatch                                                        " show search matches
se showcmd                                                          " show last command
se showmode                                                         " show current mode
se mousehide                                                        " hide mouse when entering text

se foldmethod=indent
se autoindent
se smartindent
se smarttab

se incsearch
se nohlsearch                                                       " don't hl previous search results

se scrolljump=7
se scrolloff=7

se enc=utf8

se wcm=<Tab> 
se wildmenu                                                         " tab completion in files
se wildmode=list:longest

se wrap

" STATUSLINE
se statusline=                                                      " clear the statusline for when vimrc is reloaded
se statusline+=%n                                                   " buffer number
se statusline+=%{':'.bufnr('$')}\                                   " buffers count
se statusline+=%f\                                                  " file name
se statusline+=%h%m%r%w                                             " flags
se statusline+=[%{strlen(&ft)?&ft:'none'},                          " filetype
se statusline+=%{strlen(&fenc)?&fenc:&enc},                         " encoding
se statusline+=%{&fileformat}]                                      " file format
se statusline+=%=                                                   " right align
se statusline+=%b,0x%-8B\                                           " current char
se statusline+=%-14.(%l,%c%V%)\ %<%P                                " offset

se laststatus=2

se bs=2
se ff=unix
se ffs=unix

se backspace=indent,eol,start
se lazyredraw                                                       " don't refresh screen on macros work

nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

se tabstop=4
se shiftwidth=4
se expandtab
se softtabstop=4
se showtabline=0

" PLUGINS
let g:bufExplorerShowRelativePath=1
nmap <S-b> :BufExplorer<cr>

nmap gT :bp<cr>
nmap gt :bn<cr>

if has("gui_running")
  map <D-t> <Plug>PeepOpen
end

vmap < <gv
vmap > >gv

menu Encoding.koi8-r :e ++enc=koi8-r<CR>
menu Encoding.windows-1251 :e ++enc=cp1251<CR>
menu Encoding.utf-8 :e ++enc=utf8 <CR>

imap [ []<LEFT>
imap {<CR> {<CR>}<Esc>O

filetype on
filetype plugin on
filetype indent on

au FileType helpfile                setlocal nonumber

au BufRead,BufNewFile *.phps        setlocal filetype=php
au BufRead,BufNewFile *.thtml       setlocal filetype=php

au BufRead,BufNewFile *.class.php   setlocal tabstop=2 shiftwidth=2 softtabstop=2
au BufRead,BufNewFile *.jade        setlocal tabstop=2 shiftwidth=2 softtabstop=2
au BufRead,BufNewFile *.yml         setlocal tabstop=2 shiftwidth=2 softtabstop=2

