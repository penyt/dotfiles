-- Settings of netrw.
-- Shortcuts: https://gist.github.com/danidiaz/37a69305e2ed3319bfff9631175c5d0f


vim.g.netrw_liststyle = 3  -- mode "3" is tree list style
vim.g.netrw_keepdir = 0    -- don't change pwd
vim.g.netrw_browse_split = 4
vim.g.netrw_banner = 0     -- don't show banner
vim.g.netrw_sort_by = "name"
vim.g.netrw_sort_direction = "normal"  -- A to Z
vim.g.netrw_treeview = 2
vim.g.netrw_winsize = 20

vim.api.nvim_create_autocmd("BufLeave", {
  pattern = "*",
  callback = function()
    if vim.bo.filetype == "netrw" then
      pcall(vim.cmd, "close")
    end
  end,
})


