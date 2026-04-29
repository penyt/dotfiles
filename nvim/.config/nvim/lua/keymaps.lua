-- keymaps
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- nnoremap <leader>b :Ex<CR>
keymap('n', '<leader>b', ':Ex<CR>', opts)

-- nnoremap <leader>op :Lexplore<CR>
keymap('n', '<leader>op', ':Lexplore<CR>', opts)

-- Reload config (注意：Neovim 建議 source init.lua 而不是 .vimrc)
-- nnoremap <leader>rl :source ~/.vimrc<CR>
keymap('n', '<leader>rl', ':source $MYVIMRC<CR>', opts)

-- Terminal
-- nnoremap <leader>t :call OpenFloatTerm()<CR>
keymap('n', '<leader>t', ':call OpenFloatTerm()<CR>', opts)
