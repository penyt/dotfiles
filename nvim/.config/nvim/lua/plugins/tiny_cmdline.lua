-- Border style
vim.g.tiny_cmdline = {
  border = "rounded",
}

-- Border color
vim.api.nvim_set_hl(0, "TinyCmdlineBorder", {
  fg = "#83a598",
  bg = "#3D4D47",
})

-- Background and text
vim.api.nvim_set_hl(0, "TinyCmdlineNormal", {
  fg = "#ebdbb2",
  bg = "#3D4D47",
})
