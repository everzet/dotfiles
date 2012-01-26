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
"se nosc
" don't show mod
se nosmd
" hide mouse
se mousehide
se ttyfast

se autoindent
se copyindent
se smartindent
se smarttab
se nofoldenable

se incsearch
se hlsearch
se showmatch
se ignorecase
se smartcase
se gdefault
se cursorline

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

se wrap linebreak
se textwidth=100
se colorcolumn=100
se formatoptions=qrn1

" use PAR as prg formatter (gq)
"se formatprg=par
"se formatoptions+=tca

se laststatus=2

se bs=2
se ff=unix
se ffs=unix
se backspace=indent,eol,start

call Pl#Theme#RemoveSegment('fileformat')

inoremap jj <esc>

nnoremap ; :
let mapleader=","

se listchars=tab:▸\ ,trail:□,eol:¬
se nolist
nmap <leader>ll :set list!<cr>
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader><space> :noh<cr>

" lines moving
nmap <S-up> [e
nmap <S-down> ]e
vmap <S-up> [egv
vmap <S-down> ]egv

" paths opening
nmap <leader>ep :e <C-R>=expand("%:p:h")."/"<cr>
nmap <leader>es :vsp <C-R>=expand("%:p:h")."/"<cr>
nmap <leader>se :Vex<cr><C-w>=

nmap <leader>mk :!mkdir <c-r>=expand("%:p:h")."/"<cr>
nmap <leader>rm :!rm -rf <c-r>=expand("%:p:h")."/"<cr>

" fugitive
nmap <leader>gs     :Gstatus<cr>
nmap <leader>gd     :Gdiff<cr>
nmap <leader>ga     :Gwrite<cr>
nmap <leader>gh     :Gbrowse!<cr>
nmap <leader>gc     :Gcommit<cr>
nmap <leader>gre    :Gremove<cr>
nmap <leader>gmo    :Gmove<cr>

" windows
nmap <leader>we <C-w>v<C-w>l
nmap <leader>ws <C-w>s<C-w>j
nmap <leader>wq <C-w>v<C-w>h
nmap <leader>w2 <C-w>s<C-w>k
nmap <leader>wo :on<cr>
nmap <leader>w= <C-w>=
nmap <leader>w0 <C-w>\|
nmap <leader>w- <C-w>_
nmap <C-h> <C-w>h
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-l> <C-w>l

" buffers
nmap <leader>bo :BufOnly<cr>
nmap <D-[> :bp<cr>
nmap <D-]> :bn<cr>

" Ack
nnoremap <leader>a :Ack 

" ctrlp
map <c-r> :CtrlPBuffer<cr>
let g:ctrlp_map = '<c-t>'
let g:ctrlp_working_path_mode = 2
let g:ctrlp_max_height = 15
let g:ctrlp_open_multi = '1v'
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/*cache,*/logs,.DS_Store

" command-t
map <d-t> :CommandT<cr>
map <d-r> :CommandTBuffer<cr>
let g:CommandTMatchWindowReverse = 1
let g:CommandTMaxHeight = 15

" Lusty
let g:LustyJugglerShowKeys = 'a'

" Tabular
nmap <leader><tab><tab> :Tab /
vmap <leader><tab> :Tab /
nmap <leader><tab>= :Tab /=<cr>
vmap <leader><tab>= :Tab /=<cr>
nmap <leader><tab>: :Tab /:\zs<cr>
vmap <leader><tab>: :Tab /:\zs<cr>
nmap <leader><tab>> :Tab /=><cr>
vmap <leader><tab>> :Tab /=><cr>

" disable arrow keys
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" disable shift-movement
vmap <S-h> <nop>
vmap <S-j> <nop>
vmap <S-k> <nop>
vmap <S-l> <nop>

" yankring
let g:yankring_replace_n_pkey = '<c-n>'
let g:yankring_history_file = '.yankring_history'
nmap <leader>y :YRShow<cr>

nnoremap j gj
nnoremap k gk

nnoremap <tab> %
vnoremap <tab> %

cmap w!! w !sudo tee % >/dev/null

" extra search
nnoremap / /\v
vnoremap / /\v

" move selected block
vmap < <gv
vmap > >gv

" autoinsert curlys
imap {<cr> {<cr>}<esc>O

" PhpInsertUse
map <leader>u :call PhpInsertUse()<cr>

" EasyMotion
let g:EasyMotion_leader_key='m'

" PHPDoc
nnoremap <C-P> :call PhpDocSingle()<cr>
vnoremap <C-P> :call PhpDocRange()<cr>

" Surround
let g:surround_{char2nr("b")} = "{% block\1 \r..*\r &\1 %}\r{% endblock %}"
let g:surround_{char2nr("i")} = "{% if\1 \r..*\r &\1 %}\r{% endif %}"
let g:surround_{char2nr("w")} = "{% with\1 \r..*\r &\ 1%}\r{% endwith %}"
let g:surround_{char2nr("f")} = "{% for\1 \r..*\r &\ 1%}\r{% endfor %}"

" Syntastic options
"let g:syntastic_enable_signs=0
"let g:syntastic_phpcs_conf="--standard=Symfony2"
"let g:syntastic_javascript_checker="jslint"
"let g:syntastic_json_checker="jsonlint"
"let g:syntastic_mode_map = { 'mode': 'passive',
"                           \ 'active_filetypes': ['php', 'js', 'json', 'xml', 'html', 'css'],
"                           \ 'passive_filetypes': [] }

" behat/cucumber
let feature_filetype='behat'

" my functions
nmap <silent> <leader>c :call <SID>StripTrailingWhitespaces()<cr>
nmap <leader>mv :Rename %:p:h<tab>

filetype on
filetype plugin on
filetype indent on

if has('autocmd')
    au BufWinEnter *     set foldlevel=999999 
    au FocusLost silent! :wa

    au BufWritePost .vimrc source $MYVIMRC
    au FileType helpfile                setlocal nonumber

    au BufRead,BufNewFile *.phps        setlocal filetype=php
    au BufRead,BufNewFile *.twig        setlocal filetype=django
    au BufRead,BufNewFile *.html.twig   setlocal filetype=htmldjango
    au BufRead,BufNewFile *.ejs         setlocal filetype=html
    au BufRead,BufNewFile *.json        setlocal filetype=javascript

    au BufWrite *.php,*.js,*.feature,*.json :call <SID>StripTrailingWhitespaces()

    au BufRead,BufNewFile *.class.php   setlocal tabstop=2 shiftwidth=2 softtabstop=2
    au BufRead,BufNewFile *.jade        setlocal tabstop=2 shiftwidth=2 softtabstop=2
    au BufRead,BufNewFile *.yml         setlocal tabstop=4 shiftwidth=4 softtabstop=4
    au BufRead,BufNewFile *.feature     setlocal tabstop=2 shiftwidth=2 softtabstop=2
    au BufRead,BufNewFile *.js          setlocal tabstop=4 shiftwidth=4 softtabstop=4

    au BufWrite * :call <SID>MkdirsIfNotExists(expand('<afile>:h'))
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

command! -nargs=1 -complete=file Rename call <SID>Rename(<q-args>)
function! <SID>Rename(newfile)
    let l:newfile = a:newfile
    let l:oldfile = expand('%:p')

    exe 'saveas! '.l:newfile
    call system('rm '.shellescape(l:oldfile))

    let l:lastbuf = bufnr(l:oldfile)
    exe 'bd! '.l:lastbuf
endfunction

function! <SID>MkdirsIfNotExists(directory)
    if(!isdirectory(a:directory))
        call system('mkdir -p '.shellescape(a:directory))
    endif
endfunction
