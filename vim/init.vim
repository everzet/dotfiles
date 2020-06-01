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
se number
se relativenumber
se visualbell
se ch=1
se noshowmode
se mousehide
se copyindent
se smartindent
se inccommand=nosplit
se nolist
se stal=2
se backspace=indent,eol,start
se wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/*cache,*/logs,*/web/bundles,*/dist,*/build,*/_build,.DS_Store
se path=**

""""""""""""""""""""""""""""""""""""""""
"
"  SEARCH
"
"se ignorecase
se showmatch
se smartcase
se gdefault

""""""""""""""""""""""""""""""""""""""""
"
"  STATUS LINE
"
set statusline=
set statusline+=%#PmenuSel#
set statusline+=%m
set statusline+=\ \ %{mode()}
set statusline+=\ \ %#LineNr#
set statusline+=\ %.50f
set statusline+=\%=
set statusline+=%y
set statusline+=\ %#CursorColumn#
set statusline+=\ %p%%
set statusline+=\/%L
set statusline+=\ %l:%c
set statusline+=\ "

""""""""""""""""""""""""""""""""""""""""
"
"  SCROLLING
"
se scrolljump=3
se scrolloff=3

""""""""""""""""""""""""""""""""""""""""
"
"  AUTOCOMPLETION
"
se wildcharm=<tab>
se wildmode=full

""""""""""""""""""""""""""""""""""""""""
"
"  WRAPPING
"
se wrap
se linebreak
se textwidth=98
se colorcolumn=98

""""""""""""""""""""""""""""""""""""""""
"
"  GENERAL OVERRIDINGS
"
let mapleader = ","
let maplocalleader = "\\"
inoremap jk <esc>
nnoremap Y y$

""""""""""""""""""""""""""""""""""""""""
"
"  HIGHLIGHTING MAPPINGS
"
nnoremap <leader>ll :set list!<cr>
nnoremap <silent> <leader><space> :nohlsearch<cr>

""""""""""""""""""""""""""""""""""""""""
"
"  LINES MOVEMENT
"
nnoremap ∆        10j
nnoremap ˚        10k
nnoremap <c-e>    3<c-e>
nnoremap <c-y>    3<c-y>
nnoremap <s-up>   [e
nnoremap <s-down> ]e
vnoremap <s-up>   [egv
vnoremap <s-down> ]egv

""""""""""""""""""""""""""""""""""""""""
"
"  FS NAVIGATION
"
nnoremap <leader>ep :e <c-r>=fnamemodify(expand("%:p:h"), ":~:.")."/"<cr>
nnoremap <leader>es :vsp <c-r>=fnamemodify(expand("%:p:h"), ":~:.")."/"<cr>
nnoremap <leader>se :Vex<cr><c-w>=
nnoremap <leader>mk :!mkdir <c-r>=fnamemodify(expand("%:p:h"), ":~:.")."/"<cr>
nnoremap <leader>rm :!rm -rf <c-r>=fnamemodify(expand("%:p:h"), ":~:.")."/"<cr>
cnoremap w!!        w !sudo tee % >/dev/null
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_winsize=100

""""""""""""""""""""""""""""""""""""""""
"
"  TABS MANAGEMENT
"
set showtabline=1
nnoremap <leader>df :tab split<cr>
nnoremap <leader>dd :tabclose<cr>
nnoremap <leader>do :tabonly<cr>

""""""""""""""""""""""""""""""""""""""""
"
"  BUFFERS MANAGEMENT
"
nnoremap <leader>bl :ls<cr>
nnoremap <leader>bc :bd<cr>
nnoremap <leader>bb :ls<cr>:b<space>
nnoremap <leader>bo :%bd<cr><C-O>:bd#<cr>
nnoremap <leader>bd :bufdo bd<cr>

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

"  DISABLE
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

""""""""""""""""""""""""""""""""""""""""
"
"  SEARCH TUNING
"
nnoremap / /\v
vnoremap / /\v
nnoremap * *#
nnoremap s :%s//

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

""""""""""""""""""""""""""""""""""""""""
"
"  CREATE DIRECTORY FOR CURRENT BUFFER
"
function! <sid>MkdirsIfNotExists(directory)
    if(!isdirectory(a:directory))
        call system('mkdir -p '.shellescape(a:directory))
    endif
endfunction

""""""""""""""""""""""""""""""""""""""""
"
"  CREATE TEST BINDING
"
function! BindTerminalCommand()
    let cmd = input('Command: ')
    if cmd != ''
        exec ':nmap <leader>t :split \| te ' . cmd . ' <cr>:startinsert<cr>'
    endif
endfunction
nmap <leader>bt :call BindTerminalCommand()<cr>

filetype on
filetype plugin on
filetype indent on

""""""""""""""""""""""""""""""""""""""""
"
"  AUTOCMD
"
augroup vimrc_autocmd
    if ! has('gui_running')
        set ttimeoutlen=10
        au InsertEnter * set timeoutlen=500
        au InsertLeave * set timeoutlen=1000
    endif

    autocmd!

    " General
    " au FocusLost silent! :wa
    au FileType helpfile setlocal nonumber

    " File types
    au BufRead,BufNewFile *.twig        setlocal filetype=jinja
    au BufRead,BufNewFile *.html.twig   setlocal filetype=htmljinja

    " FZF
    au! FileType fzf
    au  FileType fzf set laststatus=0 noshowmode noruler
        \| au BufLeave <buffer> set laststatus=2 showmode ruler

    " Functions
    au BufWrite * :call <sid>MkdirsIfNotExists(expand('<afile>:h'))
augroup END

""""""""""""""""""""""""""""""""""""""""
"
"  PLUGINS
"
call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-fugitive'
nnoremap <leader>gs  :Gstatus<cr>
nnoremap <leader>ga  :Gwrite<cr>
nnoremap <leader>gh  :Gbrowse!<cr>
nnoremap <leader>gc  :Gcommit --verbose<cr>
nnoremap <leader>grm :Gremove<cr>
nnoremap <leader>gmv :Gmove<cr>
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

Plug 'tpope/vim-surround'
Plug 'kana/vim-smartinput'
Plug 'austintaylor/vim-commaobject'
Plug 'tommcdo/vim-exchange'
Plug 'nelstrom/vim-visual-star-search'

Plug 'benmills/vimux'
let g:VimuxHeight = "30"
let g:VimuxOrientation = "h"
nnoremap <leader>tr :VimuxPromptCommand<cr>
nnoremap <leader>tt :VimuxRunLastCommand<cr>

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
nnoremap <c-t> :Files<cr>

Plug 'dart-lang/dart-vim-plugin'
Plug 'elmcast/elm-vim', { 'for': 'elm' }
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'chemzqm/vim-jsx-improve'

Plug 'editorconfig/editorconfig-vim'

Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#exec_cmd_async = 1

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

call plug#end()
