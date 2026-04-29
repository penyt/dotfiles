" --- Basic keybinds ---

" Set leader key
let mapleader = " "

" Netrw explorer
nnoremap <leader>b :Ex<CR>
nnoremap <leader>op :Lexplore<CR>

" Reload vimrc 
nnoremap <leader>rl :source ~/.vimrc<CR>

" Spelling completion (substitute ctrl x + ctrl k)
inoremap <C-s> <C-x><C-k>
" Completion chose menu
inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"




" --- Plugins ---

" my terminal
nnoremap <leader>t :call OpenFloatTerm()<CR>

" plugin-fzf
nnoremap <leader>ff :Files<CR>
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>bd :BD<CR>


" plugin-lsp









