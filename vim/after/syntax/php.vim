if !has('conceal') || &enc != 'utf-8'
    finish
endif

syntax match phpspecExampleName / \(its\|it\)_[^(]*/ contained containedin=phpRegion
syntax match phpspecExampleSubject / \(its_[^_]*\|it\)/ contained containedin=phpspecExampleName
syntax match phpspecDelimiter "_" conceal cchar=  contained containedin=phpspecExampleName,phpspecExampleSubject

hi phpspecExampleSubject guifg=#FAF4C6 ctermfg=230 guibg=NONE ctermbg=NONE gui=BOLD cterm=BOLD

setlocal conceallevel=2
