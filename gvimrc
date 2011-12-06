"se lines=90 columns=278
se go-=r                                                        " no right scroll
se go-=L                                                        " no left scroll
se go-=T                                                        " no toolbar
se showtabline=1                                                " show tabs only if needed
se fuopt=maxvert,maxhorz
se fu

function! DefFont()
    se guifont=Inconsolata:h13
endfunction

function! BigFont()
    se guifont=Monaco:h16
endfunction

if has("gui_macvim")
    macmenu &File.New\ Tab key=<nop>
    map <D-t> :CommandT<CR>
endif

call DefFont()
