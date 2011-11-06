se lines=68 columns=212
se go-=r                                                        " no right scroll
se go-=L                                                        " no left scroll
se go-=T                                                        " no toolbar
se showtabline=1                                                " show tabs only if needed

function! DefFont()
    se guifont=ProFontX:h9
endfunction

function! BigFont()
    se guifont=Monaco:h14
endfunction

if has("gui_macvim")
    macmenu &File.New\ Tab key=<nop>
    map <D-t> :CommandT<CR>
endif

call DefFont()
