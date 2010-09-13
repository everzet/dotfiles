" Pathogen
silent! call pathogen#runtime_append_all_bundles()

" SHell
set shell=/bin/bash\ -l

" Включаем несовместимость настроек с Vi (ибо Vi нам и не понадобится).
se nocompatible

" GUI CONFIG
colo wombat 

if has("gui_running")
    se lines=65 columns=180
    colo BusyBee
endif

" Turn off right-hand scroll-bar
se guioptions-=r
se guioptions-=L
" Скрыть панель и меню в gui версии ибо они не нужны
se guioptions-=T
"se guioptions-=m
se guifont=ProFontX:h9

" paring [] {}
se showmatch

se showcmd
se showmode

" настраиваю для работы с русскими словами (чтобы w, b, * понимали
" русские слова)
se iskeyword=@,48-57,_,192-255

" Показывать положение курсора всё время.
se ruler

" Показывать незавершённые команды в статусбаре
se showcmd

" Включаем нумерацию строк
se nu

" Фолдинг по отсупам
se foldmethod=indent

" Поиск по набору текста (очень полезная функция)
se incsearch

" Отключаем подстветку найденных вариантов, и так всё видно.
se nohlsearch

" Теперь нет необходимости передвигать курсор к краю экрана, чтобы подняться в режиме редактирования
se scrolljump=7

" Теперь нет необходимости передвигать курсор к краю экрана, чтобы опуститься в режиме редактирования
se scrolloff=7

" Кодировка текста по умолчанию
se enc=utf8

" TAB-completion для имен файлов
se wildmenu
se wildmode=list:longest

" Не выгружать буфер, когда переключаемся на другой
" Это позволяет редактировать несколько файлов в один и тот же момент без необходимости сохранения каждый раз
" когда переключаешься между ними
se hidden

" Сделать строку команд высотой в одну строку
se ch=1
" Скрывать указатель мыши, когда печатаем
se mousehide

" Включить автоотступы
se autoindent
" Включаем 'умные' отспупы ( например, автоотступ после {)
se smartindent

" Влючить подстветку синтаксиса
syntax on

se wrap
"se tw=100
"se fo+=t
"se cc=+1
"hi ColorColumn ctermbg=black guibg=black


"Вырубаем .swp и ~ (резервные) файлы
se nobackup
se noswapfile

" Формат строки состояния
se statusline=     " clear the statusline for when vimrc is reloaded
se statusline+=%-3.3n\                                            " buffer number
se statusline+=%f\                                                    " file name
se statusline+=%h%m%r%w                                         " flags
se statusline+=[%{strlen(&ft)?&ft:'none'},    " filetype
se statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
se statusline+=%{&fileformat}]                            " file format
se statusline+=%=                                                     " right align
se statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\    " highlight
se statusline+=%b,0x%-8B\                                     " current char
se statusline+=%-14.(%l,%c%V%)\ %<%P                " offse

se laststatus=2

se bs=2
se ff=unix
se ffs=unix

se backspace=indent,eol,start

" Размер табулации по умолчанию
se tabstop=4
" Количество пробелов в табе
se shiftwidth=4
" Замена таб-символов пробелами
se expandtab
" Удаляем пробелы как табы
se softtabstop=4
"Вырубаем черточки на табах
se showtabline=0
"Колоночка, чтобы показывать плюсики для скрытия блоков кода:
"se foldcolumn=1

" C-c and C-v - Copy/Paste в "глобальный клипборд"
vmap <C-C> "+yi
imap <C-V> <esc>"+gPi

" Настройки для BufExplorer
let g:bufExplorerShowRelativePath=1
nmap <S-b> :BufExplorer<cr>

if has("gui_running")
  map <D-t> <Plug>PeepOpen
end

" предыдущий/следующий буфер
nmap gT :bp<cr>
nmap gt :bn<cr>

" отступы для блоков без снятия выделения
vmap < <gv
vmap > >gv

" Меню выбора кодировки текста (koi8-r, cp1251, cp866, utf8)
se wildmenu
se wcm=<Tab> 
menu Encoding.koi8-r :e ++enc=koi8-r<CR>
menu Encoding.windows-1251 :e ++enc=cp1251<CR>
menu Encoding.utf-8 :e ++enc=utf8 <CR>

" Редко когда надо [ без пары =)
imap [ []<LEFT>

" Аналогично и для {
imap {<CR> {<CR>}<Esc>O

" Включаем filetype плугин. Настройки, специфичные для определынных файлов мы разнесём по разным местам
filetype plugin on

au BufRead,BufNewFile *.phps      se filetype=php
au BufRead,BufNewFile *.thtml     se filetype=php

" 2 таба для symfony1 и jade
au BufRead,BufNewFile *.class.php     setlocal tabstop=2 shiftwidth=2 softtabstop=2
au BufRead,BufNewFile *.jade          setlocal tabstop=2 shiftwidth=2 softtabstop=2
au BufRead,BufNewFile *.yml           setlocal tabstop=2 shiftwidth=2 softtabstop=2

