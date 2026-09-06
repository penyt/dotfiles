" --- Basic keybinds ---

" Set leader key
let mapleader = " "

" Netrw explorer
nnoremap <leader>e :Lexplore<CR>

" Write & Save
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :bdelete<CR>
nnoremap <leader>n :bnext<CR>
nnoremap <leader>m :bprevious<CR>


" Reload vimrc 
nnoremap <leader>r :source ~/.vimrc<CR>

" Spelling completion (Ctrl+s substitutes Ctrl x + Ctrl k)
inoremap <C-s> <C-x><C-k>

" Completion chose menu
inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"

" Ctrl + Arrow: move cursor between panes
nnoremap <C-Left>  <C-w>h
nnoremap <C-Down>  <C-w>j
nnoremap <C-Up>    <C-w>k
nnoremap <C-Right> <C-w>l

" Ctrl + h/j/k/l: resize panes
nnoremap <C-h> :vertical resize -2<CR>
nnoremap <C-l> :vertical resize +2<CR>
nnoremap <C-j> :resize -2<CR>
nnoremap <C-k> :resize +2<CR>

" --- Plugins ---
" my terminal
nnoremap <leader>t :call OpenFloatTerm()<CR>

" plugin-fzf
nnoremap <leader>ff :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>br :BR<CR>


" plugin-lsp

