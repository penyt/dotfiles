-- lua/terminal.lua

local float = require("utils.float")

local M = {}

local state = {
  floating = {
    buf = -1,
    win = -1,
  },
}

local function open_float_term()
  local buf

  if vim.api.nvim_buf_is_valid(state.floating.buf) then
    buf = state.floating.buf
  else
    buf = vim.api.nvim_create_buf(false, true)
    state.floating.buf = buf
  end

  local result = float.centered({
    buf = buf,
    width_ratio = 0.8,
    height_ratio = 0.8,
    title = " Terminal ",
  })

  state.floating.win = result.win

  if vim.bo[buf].buftype ~= "terminal" then
    vim.cmd("terminal")
  end

  vim.cmd("startinsert")
end

function M.toggle()
  if vim.api.nvim_win_is_valid(state.floating.win) then
    float.close_win(state.floating.win)
  else
    open_float_term()
  end
end

return M
