" Clear any existing syntax rules
syntax clear

" Define string highlighting
syntax region String start=+"+ end=+"+
highlight String guifg=#8DBB6E ctermfg=107

" Define keywords
syntax keyword Blocks while if
highlight Blocks guifg=#bf6dd8 ctermfg=170

" Define keywords
syntax keyword Keyword true false 
highlight Keyword guifg=#f1b889 ctermfg=216

" Macro
syntax keyword Macro macro endmacro
highlight Macro guifg=#f1b889 ctermfg=216

" Define arithmetic operations 
syntax match Arithmetic "[+-=<><=>=!=]"
highlight Arithmetic guifg=#9ad9ec ctermfg=153

" Define Numbers 
syntax match RuskNumber "\<\d\+\>" 
highlight RuskNumber guifg=#f1b889 ctermfg=216

" Define Stack operations
syntax keyword StackOps dup dumps swap peek dumpi drop
highlight StackOps guifg=#56a6ec ctermfg=75

" Comments
syn match Comment "//.*$" 
highlight Comment guifg=#6d7087 ctermfg=103

autocmd BufNewFile,BufRead *.rk set filetype=rusk
