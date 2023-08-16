:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

" Map leader key to comma
let mapleader=","

" ------- Line commands -------
" Use cp instead of yyp to copy the current line below
map cp yyp

" To install plugins call :PlugInstall
call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/preservim/nerdtree'
Plug 'simrat39/rust-tools.nvim'

set encoding=UTF-8

call plug#end()

" NerdTree
autocmd VimEnter * NERDTree
noremap <leader>d :NERDTreeToggle<CR>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

let g:NERDTreeDirArrowExpandable="~"
let g:NERDTreeDirArrowCollapsible="~"
let g:NERDTreeQuitOnOpen=0

" Terminal
" Remap terminal ESC to exit terminal mode
tnoremap <Esc> <C-\><C-n>
noremap <leader>tv :botright vnew <Bar> :terminal<CR>
noremap <leader>th :botright new <Bar> :terminal<CR>

