"Plugins
call plug#begin()
Plug 'whatyouhide/vim-gotham'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
call plug#end()

filetype plugin indent on
set encoding=utf-8
"set background=dark

set tabstop=2
set shiftwidth=2

set expandtab 
"let g:powerline_loaded = 1

"TODO: what it does?
"set t_Co=16
syntax enable
colorscheme gotham

"set number
set showmatch
set pastetoggle=<F2>

"copy to both clipboards
set clipboard+=unnamedplus
set clipboard+=unnamed

"fix for suckless st

set termguicolors

" air-line
"let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols (fallback for fonts without) 
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
