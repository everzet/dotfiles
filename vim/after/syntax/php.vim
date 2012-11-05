if !has('conceal') || &enc != 'utf-8'
    finish
endif

syntax match phpspecExampleName / *\(it\|its\)_[^(]*/ contained containedin=phpRegion
syntax match phpspecDelimiter "_" conceal cchar=  contained containedin=phpspecExampleName

setlocal conceallevel=2
