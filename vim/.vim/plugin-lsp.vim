let s:binary_dir = empty($LSP_BIN_DIR)
    \ ? expand('~/.local/share/nvim/mason/bin/')
    \ : expand($LSP_BIN_DIR)


let lspOpts = #{
    \   autoHighlightDiags: v:true,
    \   autoComplete: v:true,
    \   omniComplete: v:true,
    \   useBufferCompletion: v:true,
\}

autocmd User LspSetup call LspOptionsSet(lspOpts)



let lspServers = []

if executable(s:binary_dir . 'pyright-langserver')
    call add(lspServers, #{
        \ name: 'pyright',
        \ filetype: 'python',
        \ path: s:binary_dir . 'pyright-langserver',
        \ args: ['--stdio'],
        \ workspaceConfig: #{
        \   python: #{
        \     pythonPath: '/opt/homebrew/bin/python3'
        \   }
        \ }
    \})
endif

if executable(s:binary_dir . 'vim-language-server')
    call add(lspServers, #{
        \ name: 'vimls',
        \ filetype: 'vim',
        \ path: s:binary_dir . 'vim-language-server',
        \ args: ['--stdio'],
    \})
endif


autocmd User LspSetup call LspAddServer(lspServers)

" Set omnifunc for completion
autocmd FileType php setlocal omnifunc=lsp#complete

" Custom diagnostic sign characters
autocmd User LspSetup call LspOptionsSet(#{
    \   diagSignErrorText: '✘',
    \   diagSignWarningText: '▲',
    \   diagSignInfoText: '»',
    \   diagSignHintText: '⚑',
    \ })
