""""""""""""""""""""""""""""""""""""

"  PLUGINS
"
call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'kana/vim-smartinput'
Plug 'austintaylor/vim-commaobject'
Plug 'tommcdo/vim-exchange'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'elmcast/elm-vim', { 'for': 'elm' }
Plug 'elixir-editors/vim-elixir', { 'for': 'elixir' }

Plug 'editorconfig/editorconfig-vim'

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

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
se number
se relativenumber
se visualbell
se ch=1
se noshowmode
se mousehide
se copyindent
se smartindent
se nolist
se stal=2
se backspace=indent,eol,start
se wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/*cache,*/logs,*/web/bundles,*/dist,*/build,*/_build,.DS_Store
se path=**

"
""""""""""""""""""""""""""""""""""""""""
"
"  SEARCH
"
se showmatch
se ignorecase
se smartcase
se gdefault

"
""""""""""""""""""""""""""""""""""""""""
"
"  STATUS LINE
"
function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?' '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#WildMenu#
set statusline+=\ %{mode()}\ "
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f "
set statusline+=%m\ "
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\ "

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

"
""""""""""""""""""""""""""""""""""""""""
"
"  WRAPPING
"
se wrap
se linebreak
se textwidth=98
se colorcolumn=98

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
"  HIGHLIGHTING MAPPINGS
"
nnoremap <leader>ll :set list!<cr>
nnoremap <silent> <leader><space> :nohlsearch<cr>

"
""""""""""""""""""""""""""""""""""""""""
"
"  LINES MOVEMENT
"
nnoremap ∆        10j
nnoremap ˚        10k
nnoremap <s-up>   [e
nnoremap <s-down> ]e
vnoremap <s-up>   [egv
vnoremap <s-down> ]egv

"
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

"
""""""""""""""""""""""""""""""""""""""""
"
"  FILE BROWSER
"
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_liststyle=3
let g:netrw_list_hide=netrw_gitignore#Hide()

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
"  BUFFERS MANAGEMENT
"
nnoremap <leader>bl :ls<cr>
nnoremap <leader>bc :bd<cr>
nnoremap <leader>bo :ls<cr>:b<space>

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
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --color "always" '.shellescape(<q-args>), 1, <bang>0)
nnoremap <c-t> :Files<cr>
nnoremap <c-f> :Find<space>

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

    " FZF
    au! FileType fzf
    au  FileType fzf set laststatus=0 noshowmode noruler
        \| au BufLeave <buffer> set laststatus=2 showmode ruler

    " Functions
    au BufWrite * :call <sid>MkdirsIfNotExists(expand('<afile>:h'))
augroup END
