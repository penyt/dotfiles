-- keymaps

local keymap = vim.keymap.set

-- ==================
-- =     Basics     =
-- ==================
keymap('n', '<leader>w', ':w<CR>',  { desc = "Write" })  -- write
keymap('n', '<leader>q', ':qa<CR>', { desc = "Quit"  })  -- quit
keymap('n', '<leader>a', 'ggVG',    { desc = "Select all (like ctrl+a)" })  -- quit

keymap("i", "jk", "<Esc>", { desc = "Exit insert mode" }) -- ESC, speed: see timeoutlen

-- yank
vim.keymap.set("n", "Y", '"+yy', { desc = "Yank line to OS clipboard" })
vim.keymap.set("v", "Y", '"+y', { desc = "Yank selection to OS clipboard" })

-- file explorer (nvim-tree)
keymap("n", "<leader>e", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle nvim-tree",})

-- toggle vertical cursor highlight
keymap("n", "<leader>cc", function()
  vim.o.cursorcolumn = not vim.o.cursorcolumn
end, { desc = "Toggle cursor column" })


-- =====================
-- =    Navigation     =
-- =====================
-- buffers
keymap("n", "<leader>n", "<cmd>bnext<CR>",     { desc = "Next buffer"     })
keymap("n", "<leader>b", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
keymap("n", "<leader>x", function()
  require("mini.bufremove").delete()  -- built-in bdelete often causes problems
end, { desc = "Close buffer" })

-- focus windows (panes)
keymap("n", "<C-h>", "<C-w>h", { desc = "Focus left windows" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Focus down window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Focus up window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Focus right window" })

-- resize windows (panes)
keymap("n", "<C-Left>",  "<cmd>vertical resize -2<CR>", { desc = "Decrease width" })
keymap("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase width" })
keymap("n", "<C-Up>",    "<cmd>resize +2<CR>", { desc = "Increase height" })
keymap("n", "<C-Down>",  "<cmd>resize -2<CR>", { desc = "Decrease height" })



-- ================
-- =     List     =
-- ================
vim.api.nvim_create_user_command("ListPlugin", function()
  for _, p in ipairs(vim.pack.get()) do
    print(p.spec.name)
  end
end, {})

vim.api.nvim_create_user_command("ListBuffers", "buffers", {})


-- ================
-- =     Mini     =
-- ================
local MiniSessions = require("mini.sessions")
keymap("n", "<leader>m", ":lua Mini", { desc = "Mini lua cmd (:lua Mini)" })

-- mini.pick
vim.cmd([[cabbrev P Pick]])                  -- picker: make :P acts as :Pick
keymap("n", "<leader>pp", ":Pick ", { desc = "Pick cmd (mini)" })   -- picker: bind <leader>pp to acts as :Pick
keymap("n", "<leader>pb", ":Pick buffers<CR>", { desc = "Pick buffers" })
keymap("n", "<leader>pf", ":Pick files<CR>",   { desc = "Pick files"   })

-- mini.sessions
keymap("n", "<leader>ss", MiniSessions.select, { desc = "Select session" })
keymap("n", "<leader>sw", MiniSessions.write,  { desc = "Save session"   })
keymap("n", "<leader>sl", MiniSessions.read,   { desc = "Load session"   })







-- Open floating terminal
keymap({ "n", "t" }, "<C-\\>", function()
  require("terminal").toggle()
end, { desc = "Toggle floating terminal" })





-- <leader> e to open netrw explorer
-- vim.keymap.set("n", "<leader>e", function()
--   vim.cmd("enew")
--   vim.cmd("Explore")
-- end, {
--   desc = "Open netrw in new buffer",
-- })



