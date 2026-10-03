" --- Basic options ---

" ===== Theme =====
autocmd vimenter * ++nested colorscheme gruvbox
set background=dark


" ===== Basics =====
set showmatch  " check )]} matching
set cursorline
set mouse=a
syntax on
set number
set relativenumber
set timeoutlen=300
set ttimeoutlen=50
set clipboard=unnamed " copy to OS clipboard
set hidden
set signcolumn=yes
set whichwrap+=h,l,<,>,[,] " go to next/prev line by h/j or <-/->
set showtabline=2     " menge.../lightline-bufferline


" ===== Cursor =====
"   Ps = 0  -> blinking block            Ps = 4  -> steady underline
"   Ps = 1  -> blinking block (default)  Ps = 5  -> blinking bar (xterm)
"   Ps = 2  -> steady block              Ps = 6  -> steady bar (xterm)
"   Ps = 3  -> blinking underline
let &t_SI = "\e[6 q"  " SI: insert mode
let &t_EI = "\e[2 q"  " EI: everything else
set scrolloff=8


" ===== Indentation and tabs =====
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent
set autoindent
set expandtab   " tab -> space
set list
set listchars=tab:│\ ,trail:·

" ===== File Explore =====
let g:netrw_liststyle = 3 " tree
let g:netrw_keepdir = 0
let g:netrw_browse_split = 0
let g:netrw_banner = 0
let g:netrw_sort_by = 'name'
let g:netrw_sort_direction = 'normal'
let g:netrw_treeview = 2
let g:netrw_winsize = 25
set wildignore+=.swp,.swo,*~
set wildignore+=.DS_Store
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\(DS_Store\|_*\.sw[op]\)$'
      \ . ',.*~$'

" Cleanup netrw buffer
" autocmd BufLeave * if &filetype ==# 'netrw' | close | endif
function! CleanupEmptyNetrwBuffers()
  for l:buf in getbufinfo({'buflisted': 1})
    if l:buf.name ==# ''
          \ && !l:buf.changed
          \ && empty(win_findbuf(l:buf.bufnr))
      execute 'silent! bwipeout ' . l:buf.bufnr
    endif
  endfor
endfunction

augroup NetrwCleanup
  autocmd!
  autocmd BufEnter * call CleanupEmptyNetrwBuffers()
augroup END

" Keep resize ratio
function! ResizeNetrw()
  if winnr('$') <= 1
    return
  endif

  for l:win in getwininfo()
    if getwinvar(l:win.winid, '&filetype') ==# 'netrw'
      call win_execute(
            \ l:win.winid,
            \ 'vertical resize ' . float2nr(&columns * 0.25)
            \ )
    endif
  endfor
endfunction

augroup NetrwResize
  autocmd!
  autocmd BufWinEnter * call ResizeNetrw()
augroup END


" ===== Dictionary completion =====
set spell
set completeopt=menuone











