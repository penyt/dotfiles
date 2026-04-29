vim.g.mapleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = 'yes'
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.clipboard = 'unnamedplus' -- os clipboard
vim.opt.showtabline = 1
vim.opt.tabline = ''
vim.opt.scrolloff = 8

-- keymaps
require('keymaps')   -- "keymaps.lua"

-- terminal
require('terminal')  -- "terminal.lua"

-- File explorer: netrw
require('netrw')     -- "netrw.lua"

-- vim native package manerger
vim.pack.add ({
	{ src = "https://github.com/ellisonleao/gruvbox.nvim" }, -- colorscheme
	{ src = 'https://github.com/neovim/nvim-lspconfig' },    -- lsp default config
	{ src = 'https://github.com/mason-org/mason.nvim' },     -- lsp install manager
	{ src = 'https://github.com/nvim-lualine/lualine.nvim' },-- lualine
	{ src = 'https://github.com/junegunn/fzf' },             -- fzf
	{ src = 'https://github.com/junegunn/fzf.vim' },         -- fzf
	{ src = 'https://github.com/saghen/blink.cmp', version = vim.version.range("*") }, -- auto completion
})


-- "gruvbox.nvim" setting: set colorscheme
vim.cmd("colorscheme gruvbox")


-- "mason.nvim" setting: initialize mason
require("mason").setup()


-- "lualine.nvim" setting      in 'lua/plugins/lualine.lua'
vim.opt.showmode = false
require('plugins.lualine')


-- "fzf" & "fzf.vim" setting   in 'lua/plugins/fzf.lua'
require('plugins.fzf')


-- "blink.cmp" setting         in 'lua/plugins/blink.lua'
require('plugins.blink')


-- LSP config & LSP enable
require('lspconfig') -- 'lua/lspconfig.lua'

vim.diagnostic.config({  -- let error message appear behind the line
	virtual_text = { spacing = 2 },
})

vim.lsp.enable({"lua_ls"})
vim.lsp.enable({"pyright"})
