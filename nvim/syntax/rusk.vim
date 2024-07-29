" Clear any existing syntax rules
syntax clear

" Define keyword highlighting
syntax keyword rusk if while
highlight link rusk Keyword

" Define string highlighting
syntax region String start=+"+ end=+"+
highlight mylangString guifg=#8DBB6E ctermfg=107

" Define keywords
syntax keyword Keywords while if
highlight Keywords guifg=#bf6dd8 ctermfg=170

" Define Stack operations
syntax keyword StackOps dup dumps 
highlight StackOps guifg=#56a6ec ctermfg=75
