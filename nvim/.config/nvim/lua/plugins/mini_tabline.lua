vim.api.nvim_set_hl(0, "MiniTablineModifiedCurrent", {
  link = "MiniTablineCurrent",
})

vim.api.nvim_set_hl(0, "MiniTablineModifiedVisible", {
  link = "MiniTablineVisible",
})

vim.api.nvim_set_hl(0, "MiniTablineModifiedHidden", {
  link = "MiniTablineHidden",
})

vim.api.nvim_set_hl(0, "MiniTablineCurrent", {
  fg = "#1c1c1c",
  bg = "#d5c4a1",
  bold = true,
})

local MiniTabline = require("mini.tabline")

return {
  format = function(buf_id, label)

    if label:match("^NvimTree_%d+$") then -- don't show nvim-tree empty buffer
      return ""
    end

    local suffix = vim.bo[buf_id].modified and "◉  " or ""
    return MiniTabline.default_format(buf_id, label) .. suffix
  end,
}
