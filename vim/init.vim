""""""""""""""""""""""""""""""""""""""""
"
"  PLUGINS
"
call plug#begin('~/.config/nvim/plugged')

Plug 'bling/vim-airline'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/BufOnly.vim'
Plug 'kana/vim-smartinput'
Plug 'austintaylor/vim-commaobject'
Plug 'Lokaltog/vim-easymotion'
Plug 'neomake/neomake'
Plug 'airblade/vim-gitgutter'
Plug 'godlygeek/tabular'
Plug 'benmills/vimux'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'sheerun/vim-polyglot'
Plug 'editorconfig/editorconfig-vim'
Plug 'slashmili/alchemist.vim', { 'for': 'elixir' }
Plug 'elmcast/elm-vim', { 'for': 'elm' }

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }

call plug#end()

"
""""""""""""""""""""""""""""""""""""""""
"
"  HIGHLIGHTING
"
syntax on
colo mustango
se cursorline
se listchars=tab:▸\ ,trail:□,eol:¬
se t_ZH=[3m
se t_ZR=[23m

"
""""""""""""""""""""""""""""""""""""""""
"
"  ENVIRONMENT
"
se fileformat=unix
se fileformats=unix
se hidden
se nobackup
se noswapfile
se dir=/tmp,/var/tmp
se relativenumber
se number
se visualbell
se ch=1
se noshowmode
se mousehide
se copyindent
se smartindent
se nolist
se backspace=indent,eol,start
se wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/*cache,*/logs,*/web/bundles,.DS_Store
se path=**

"
""""""""""""""""""""""""""""""""""""""""
"
"  FOLDING
"
se foldmethod=syntax
se foldlevel=1

"
""""""""""""""""""""""""""""""""""""""""
"
"  SEARCH
"
se showmatch
se ignorecase
se smartcase
se gdefault
se tags+=vendor.tags

"
""""""""""""""""""""""""""""""""""""""""
"
"  SCROLLING
"
se scrolljump=3
se scrolloff=3

"
""""""""""""""""""""""""""""""""""""""""
"
"  AUTOCOMPLETION
"
se wildcharm=<tab>
se wildmode=full
inoremap <c-l> <c-x><c-l>
let g:deoplete#enable_at_startup = 1
let g:alchemist_tag_stack_map = '<C-Q>'

"
""""""""""""""""""""""""""""""""""""""""
"
"  WRAPPING
"
se wrap
se linebreak
se textwidth=100
se colorcolumn=100
"se formatprg=par
"se formatoptions+=tca

"
"+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
"|
"|  > CUSTOM MAPPINGS
"|
"|
""""""""""""""""""""""""""""""""""""""""
"
"  COPY-PASTE
"
"set clipboard=unnamed
"
" Use "+p (in N) or <c-r>+ (in I)

"
""""""""""""""""""""""""""""""""""""""""
"
"  GENERAL OVERRIDINGS
"
let mapleader = ","
let maplocalleader = "\\"
inoremap jk <esc>
inoremap <esc> <nop>
nnoremap Y y$

"
""""""""""""""""""""""""""""""""""""""""
"
"  DASH
"
nnoremap <leader>d :Dash<cr>

"
""""""""""""""""""""""""""""""""""""""""
"
"  HIGHLIGHTING MAPPINGS
"
nnoremap <leader>ll :set list!<cr>
nnoremap <silent> <leader><space> :nohlsearch<cr>

"
""""""""""""""""""""""""""""""""""""""""
"
"  LINES MOVEMENT
"
nnoremap <s-up>   [e
nnoremap <s-down> ]e
vnoremap <s-up>   [egv
vnoremap <s-down> ]egv

"
""""""""""""""""""""""""""""""""""""""""
"
"  FS NAVIGATION
"
nnoremap <leader>ep :e <c-r>=expand("%:p:h")."/"<cr>
nnoremap <leader>es :vsp <c-r>=expand("%:p:h")."/"<cr>
nnoremap <leader>se :Vex<cr><c-w>=
nnoremap <leader>mk :!mkdir <c-r>=expand("%:p:h")."/"<cr>
nnoremap <leader>rm :!rm -rf <c-r>=expand("%:p:h")."/"<cr>
cnoremap w!!        w !sudo tee % >/dev/null

"
""""""""""""""""""""""""""""""""""""""""
"
"  TABS MANAGEMENT
"
nnoremap <leader>df :tab split<cr>
nnoremap <leader>dd :tabclose<cr>
nnoremap <leader>do :tabonly<cr>

"
""""""""""""""""""""""""""""""""""""""""
"
"  WINDOWS MANAGEMENT
"
nnoremap <leader>we <c-w>v<c-w>l
nnoremap <leader>ws <c-w>s<c-w>j
nnoremap <leader>wq <c-w>v<c-w>h
nnoremap <leader>w2 <c-w>s<c-w>k
nnoremap <leader>wo :on<cr>
nnoremap <leader>w= <c-w>=
nnoremap <leader>w0 <c-w>\|
nnoremap <leader>w- <c-w>_
nnoremap <leader>wk <c-w>K
nnoremap <leader>wh <c-w>H
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-x> <c-w>x
tnoremap <c-h> <c-\><c-n><c-w>h
tnoremap <c-j> <c-\><c-n><c-w>j
tnoremap <c-k> <c-\><c-n><c-w>k
tnoremap <c-l> <c-\><c-n><c-w>l
tnoremap <c-x> <c-\><c-n><c-w>x

"
""""""""""""""""""""""""""""""""""""""""
"
"  BUFFERS MANAGEMENT
"
nnoremap <leader>bo :BufOnly<cr>
nnoremap <leader>bc :bd<cr>

"
""""""""""""""""""""""""""""""""""""""""
"
"  MOVEMENT TUNING
"
nnoremap j     gj
nnoremap k     gk
nnoremap <tab> %
vnoremap <tab> %
vnoremap <     <gv
vnoremap >     >gv

"
""""""""""""""""""""""""""""""""""""""""
"
"  MOVEMENT COMBINATIONS TUNING
"
nnoremap <up>    <nop>
nnoremap <down>  <nop>
nnoremap <left>  <nop>
nnoremap <right> <nop>
inoremap <up>    <nop>
inoremap <down>  <nop>
inoremap <left>  <nop>
inoremap <right> <nop>
vnoremap <s-h>   <nop>
vnoremap <s-j>   <nop>
vnoremap <s-k>   <nop>
vnoremap <s-l>   <nop>

"
""""""""""""""""""""""""""""""""""""""""
"
"  SEARCH TUNING
"
nnoremap / /\v
vnoremap / /\v
nnoremap * *N


"
"+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
"|
"|  > PLUGINS CONFIGURATION
"|
"|
""""""""""""""""""""""""""""""""""""""""
"
"  AIRLINE
"
let g:airline_theme='wombatish'
let g:airline_powerline_fonts=0

"
""""""""""""""""""""""""""""""""""""""""
"
"  FUGITIVE
"
nnoremap <leader>gs  :Gstatus<cr>
nnoremap <leader>ga  :Gwrite<cr>
nnoremap <leader>gh  :Gbrowse!<cr>
nnoremap <leader>gc  :Gcommit --verbose<cr>
nnoremap <leader>grm :Gremove<cr>
nnoremap <leader>gmv :Gmove<cr>
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

"
""""""""""""""""""""""""""""""""""""""""
"
"  FZF
"
nnoremap <c-t> :FZF<cr>

"
""""""""""""""""""""""""""""""""""""""""
"
"  TABULAR
"
nnoremap <leader><tab><tab> :Tab /
nnoremap <leader><tab>= :Tab /=<cr>
nnoremap <leader><tab>: :Tab /:\zs<cr>
nnoremap <leader><tab>> :Tab /=><cr>
vnoremap <leader><tab> :Tab /
vnoremap <leader><tab>= :Tab /=<cr>
vnoremap <leader><tab>: :Tab /:\zs<cr>
vnoremap <leader><tab>> :Tab /=><cr>

"
""""""""""""""""""""""""""""""""""""""""
"
"  EASYMOTION
"
let g:EasyMotion_leader_key='t'

"
""""""""""""""""""""""""""""""""""""""""
"
"  NEOMAKE
"
function! NeomakeCredoErrorType(entry)
    if a:entry.type ==# 'W'
        let a:entry.type = 'W'
    else
        let a:entry.type = 'I'
    endif
endfunction
let g:neomake_elixir_credo_maker = {
    \ 'exe': 'mix',
    \ 'args': ['credo', 'list', '%:p', '--format=oneline'],
    \ 'errorformat': '[%t] %. %f:%l:%c %m',
    \ 'postprocess': function('NeomakeCredoErrorType')
    \ }

let g:neomake_elixir_enabled_makers = ['mix', 'credo']

"
""""""""""""""""""""""""""""""""""""""""
"
"  VIMUX
"
nnoremap <leader>vr :VimuxPromptCommand<cr>
nnoremap <leader>vl :VimuxRunLastCommand<cr>
nnoremap <leader>vc :VimuxCloseRunner<cr>

"
""""""""""""""""""""""""""""""""""""""""
"
"  TESTS
"
nmap <silent> <leader>tt :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ta :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>

"
""""""""""""""""""""""""""""""""""""""""
"
"  Polyglot
"
let g:polyglot_disabled = ['elm']

"
""""""""""""""""""""""""""""""""""""""""
"
"  ELM
"
let g:elm_format_autosave = 0
let g:elm_setup_keybindings = 0

"
"+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
"|
"|  > CUSTOM FUNCTIONS
"|
"|
""""""""""""""""""""""""""""""""""""""""
"
"  RENAME CURRENT BUFFER FILE
"
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction
nnoremap <leader>mv :call RenameFile()<cr>

"
""""""""""""""""""""""""""""""""""""""""
"
"  CREATE DIRECTORY FOR CURRENT BUFFER
"
function! <sid>MkdirsIfNotExists(directory)
    if(!isdirectory(a:directory))
        call system('mkdir -p '.shellescape(a:directory))
    endif
endfunction

"
"+>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
"|
"|  > AUTOCMD
"|
"|
filetype on
filetype plugin on
filetype indent on

augroup vimrc_autocmd
    if ! has('gui_running')
        set ttimeoutlen=10
        au InsertEnter * set timeoutlen=500
        au InsertLeave * set timeoutlen=1000
    endif

    autocmd!

    " General
    au FocusLost silent! :wa
    au FileType helpfile setlocal nonumber

    " File types
    au BufRead,BufNewFile *.php         setlocal filetype=php iskeyword-=$
    au BufRead,BufNewFile *.php         inoremap <buffer> § $
    au BufRead,BufNewFile *.php         inoremap <buffer> ± ->
    au BufRead,BufNewFile *.php         inoremap <buffer> §§ $this->
    au BufRead,BufNewFile *.twig        setlocal filetype=jinja
    au BufRead,BufNewFile *.html.twig   setlocal filetype=htmljinja
    au BufRead,BufNewFile *.js.twig     setlocal filetype=javascript
    au BufRead,BufNewFile *.ejs         setlocal filetype=html
    au BufRead,BufNewFile *.json        setlocal filetype=javascript
    au BufRead,BufNewFile *.pp          setlocal filetype=ruby

    " Autocalls
    au BufWrite * :call <sid>MkdirsIfNotExists(expand('<afile>:h'))
    au BufWritePost,BufEnter * Neomake
    au BufWritePost *.elm ElmFormat
augroup END
