-- 1. 建立一個狀態容器，用來追蹤終端機的 Buffer 和 Window
local state = {
  floating = {
    buf = -1,
    win = -1,
  }
}

-- 2. 建立浮動視窗的內部函數
local function open_float_term(opts)
  opts = opts or {}

  -- 計算尺寸：設定為螢幕寬高各 80%
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local col = math.floor((vim.o.columns - width) / 2)
  local row = math.floor((vim.o.lines - height) / 2)

  -- 檢查目前的 Buffer 是否有效，若無則建立新 Buffer
  local buf = nil
  if vim.api.nvim_buf_is_valid(state.floating.buf) then
    buf = state.floating.buf
  else
    buf = vim.api.nvim_create_buf(false, true) -- 不列出 (no-listed), 臨時 (scratch)
    state.floating.buf = buf
  end

  -- 視窗外觀設定
  local win_config = {
    relative = "editor",
    width = width,
    height = height,
    col = col,
    row = row,
    style = "minimal",
    border = "rounded",
    title = " Terminal ",
    title_pos = "center",
  }

  -- 開啟視窗
  local win = vim.api.nvim_open_win(buf, true, win_config)

  -- 如果這個 Buffer 還沒啟動過終端機進程，就啟動它
  if vim.bo[buf].buftype ~= "terminal" then
    vim.cmd.term()
  end

  return win
end

-- 3. 定義切換 (Toggle) 函數
local function toggle_float_term()
  if not vim.api.nvim_win_is_valid(state.floating.win) then
    -- 視窗沒開 -> 開啟視窗
    state.floating.win = open_float_term()
    vim.cmd("startinsert") -- 自動進入輸入模式，不用手動按 i
  else
    -- 視窗開著 -> 隱藏視窗 (不刪除 Buffer，讓進程在後台跑)
    vim.api.nvim_win_close(state.floating.win, true)
  end
end

-- 4. 設定快捷鍵 (支援 Normal 模式與 Terminal 模式)
-- 這樣在終端機裡面輸入時按 <leader>t 也能直接關閉
vim.keymap.set({ "n", "t" }, "<leader>t", toggle_float_term, { desc = "Toggle Floating Terminal" })
