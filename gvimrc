se lines=68 columns=212
se go-=r                                                        " no right scroll
se go-=L                                                        " no left scroll
se go-=T                                                        " no toolbar
se showtabline=1                                                " show tabs only if needed

map <D-t> <Plug>PeepOpen

function! DefFont()
    se guifont=ProFontX:h9
endfunction

function! BigFont()
    se guifont=Monaco:h14
endfunction

call DefFont()
