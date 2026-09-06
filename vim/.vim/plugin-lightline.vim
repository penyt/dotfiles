" Config for plugin 'lightline'
" https://github.com/itchyny/lightline.vim
set laststatus=2
let g:lightline = {
      \ 'colorscheme' : 'Tomorrow_Night',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \   'right': [ [ 'lineinfo' ], [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['close'] ]
      \ },
      \
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'filename': 'LightlineFilename',
      \   'modified': 'LightlineModified',
      \ },
    \ }
" component_expand: use mengelbrecht/lightline-bufferline


" Status Line
function! LightlineFilename()
  return expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
endfunction

function! LightlineModified()
  return &modified ? '✎' : ''
endfunction


" Buffer Line
let g:lightline.component_raw = {'buffers': 1}
let g:lightline#bufferline#clickable = 1
let g:lightline#bufferline#unnamed = '[No Name]'





