-- lua/utils/float.lua

local M = {}

function M.centered(opts)
  opts = opts or {}

  local width = opts.width or math.floor(vim.o.columns * (opts.width_ratio or 0.8))
  local height = opts.height or math.floor(vim.o.lines * (opts.height_ratio or 0.8))

  local row = opts.row or math.floor((vim.o.lines - height) / 2)
  local col = opts.col or math.floor((vim.o.columns - width) / 2)

  local buf = opts.buf
  if not buf or not vim.api.nvim_buf_is_valid(buf) then
    buf = vim.api.nvim_create_buf(false, true)
  end

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = row,
    col = col,
    style = "minimal",
    border = opts.border or "rounded",
    title = opts.title,
    title_pos = opts.title_pos or "center",
  })

  return {
    buf = buf,
    win = win,
  }
end

function M.close_win(win)
  if win and vim.api.nvim_win_is_valid(win) then
    vim.api.nvim_win_close(win, true)
  end
end

return M
