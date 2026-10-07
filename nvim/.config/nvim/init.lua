-- =============================
-- =     Theme & Leader key    =
-- =============================
vim.g.mapleader     = " "            -- LeaderKey: space
vim.opt.background  = "dark"      -- dark mode
vim.cmd.colorscheme("retrobox")  -- ~gruvbox

-- ==================
-- =     Basics     =
-- ==================
vim.opt.showmatch   = true      -- check )]} matching
vim.opt.cursorline  = true     -- horizontal
vim.opt.scrolloff   = 8
vim.opt.showtabline = 2
vim.opt.number      = true
vim.opt.rnu         = true
vim.opt.timeoutlen  = 500
vim.opt.mouse       = "a"
vim.g.clipboard     = "osc52"
-- vim.opt.clipboard   = "unnamed" -- os clipboard
vim.opt.signcolumn  = "yes"
-- vim.opt.ttimeoutlen = 50
vim.opt.whichwrap:append("h,l,<,>,[,]")
vim.opt.sessionoptions:remove("blank")
vim.opt.showmode    = false      -- prevent mode words show under statusline (lualine)
vim.opt.pumborder   = "double"   -- floating window's border (none/single/double/rounded/solid/shadow)
vim.opt.winborder   = "double"   -- window's border
vim.o.cmdheight     = 0          -- tiny-cmdline required


-- ===================
-- =     Plugins     =
-- ===================
vim.pack.add ({
  { src = "https://github.com/neovim/nvim-lspconfig" },        -- lsp default config
  { src = "https://github.com/mason-org/mason.nvim" },         -- lsp install manager
  { src = "https://github.com/nvim-tree/nvim-tree.lua" },      -- tree file explorer
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },    -- lualine
  { src = "https://github.com/rachartier/tiny-cmdline.nvim" }, -- center cmdline
  { src = "https://github.com/nvim-mini/mini.nvim" },          -- mini.nvim
})

-- vim.pack.del( {"nui.nvim"} )


-- =============================================
-- =     Plugins: basic setup & initialize     =
-- =============================================
-- ☁︎  "mason.nvim" setting: initialize mason
require("mason").setup()

-- ☁︎  "nvim-tree.lua" setting, ref: https://github.com/nvim-tree/nvim-tree.lua#setup
vim.g.loaded_netrw       = 1        -- nvim-tree
vim.g.loaded_netrwPlugin = 1  -- nvim_tree
vim.opt.termguicolors    = true  -- nvim_tree
require("nvim-tree").setup(require("plugins.nvim_tree"))

-- ☁︎  "lualine.nvim" setting
require("lualine"  ).setup(require("plugins.lua_line" ))   -- "lua/plugins/lualine.lua"

-- ☁︎  "tiny-cmdline.nvim" need ui2
require("vim._core.ui2").enable({})
require("plugins.tiny_cmdline")

-- ☁︎  "mini.nvim" settings/
require("mini.surround"   ).setup()          -- surround brackets
require("mini.cmdline"    ).setup()          -- command completion window
require("mini.tabline"    ).setup( require("plugins.mini_tabline"    ))  -- tabline
require("mini.clue"       ).setup( require("plugins.mini_clue"       ))  -- which key
require("mini.icons"      ).setup()          -- icons
MiniIcons.mock_nvim_web_devicons ()          -- icons can be used by nvim-tree
require("mini.completion" ).setup()          -- completion
require("mini.bufremove"  ).setup()          -- buffer remove
require("mini.indentscope").setup( require("plugins.mini_indentscope"))  -- indent highlight
require("mini.starter"    ).setup( require("plugins.mini_starter"    ))  -- start screen
require("mini.sessions"   ).setup( require("plugins.mini_sessions"   ))  -- sessions
require("mini.pick"       ).setup()          -- picker


require("keymaps")      -- "keymaps.lua"
require("indentline")   -- "indentline.lua": add indentation lines


-- ===============
-- =     LSP     =
-- ===============

-- LSP config 
require("plugins.lspconfig") -- "lua/plugins/lspconfig.lua"

-- let error message appear behind the line
vim.diagnostic.config({
	virtual_text = { spacing = 2 },
})

-- LSP enable
vim.lsp.enable({"lua_ls"})
vim.lsp.enable({"pyright"})
vim.lsp.enable({"yaml-language-server"})




