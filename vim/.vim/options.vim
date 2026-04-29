" --- Basic options ---

" Theme
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark

" Basics
filetype plugin indent on
set showmatch  " check )]} matching
set cursorline
set mouse=a
syntax on
set number
set relativenumber
set timeoutlen=300
set ttimeoutlen=10
set clipboard=unnamed " copy to OS clipboard
set hidden

" Cursor
"  Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
let &t_SI = "\e[6 q"  " SI: insert mode
let &t_EI = "\e[2 q"  " EI: everything else
set scrolloff=8

" Indentation and tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent
set autoindent
set expandtab   " tab -> space
set signcolumn=yes

" File Explore
let g:netrw_liststyle = 3
let g:netrw_keepdir = 0
let g:netrw_browse_split = 4
let g:netrw_banner = 0
let g:netrw_sort_by = 'name'
let g:netrw_sort_direction = 'normal'
let g:netrw_treeview = 2
let g:netrw_winsize = 20
autocmd BufLeave * if &filetype ==# 'netrw' | close | endif

" Dictionary completion
set spell
set completeopt=menuone











