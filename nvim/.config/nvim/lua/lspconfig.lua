-- Additional lsp config.

-- lua_ls config
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } }, -- ignore vim. error
    },
  },
})

