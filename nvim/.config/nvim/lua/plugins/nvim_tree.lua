local function show_nvim_tree_keymaps()
  local keymaps = {
    { "a",    "Create" },
    { "c",    "Copy" },
    { "p",    "Paste" },
    { "x",    "Cut" },
    { "D",    "Trash" },
    { "d",    "Delete (directly)" },
    { "r",    "Rename" },
    { "R",    "Refresh" },
    { "E",    "Expand all" },
    { "W",    "Collapse all" },
    { "H",    "Toggle hidden files" },
    { "g?",   "Official help" },
  }

  -- table.sort(keymaps, function(a, b)
  --   return a[2] < b[2]
  -- end)

  local lines = {}

  for _, map in ipairs(keymaps) do
    table.insert(lines, string.format("  %-8s %s", map[1], map[2]))
  end

  local width = 0
  for _, line in ipairs(lines) do
    width = math.max(width, vim.fn.strdisplaywidth(line))
  end

  local height = #lines
  width = width + 2

  local buf = vim.api.nvim_create_buf(false, true)

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    row = vim.o.lines - height - 3,
    col = 1,
    -- border = "rounded",
    style = "minimal",
    title = " My NvimTree Keymaps ",
    title_pos = "left",
  })

  vim.bo[buf].modifiable = false

  local function close()
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
  end

  vim.keymap.set("n", "q", close, {
    buffer = buf,
    silent = true,
  })

  vim.keymap.set("n", "<Esc>", close, {
    buffer = buf,
    silent = true,
  })

  vim.keymap.set("n", "?", close, {
    buffer = buf,
    silent = true,
  })
end

local function my_on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return {
      desc = "nvim-tree: " .. desc,
      buffer = bufnr,
      noremap = true,
      silent = true,
      nowait = true,
    }
  end

  -- Official mappings
  api.map.on_attach.default(bufnr)

  -- Custom mapping
  vim.keymap.set(
    "n",
    "?",
    show_nvim_tree_keymaps,
    opts("My Keymaps")
  )
end




return {
  on_attach = my_on_attach,

  view = {
    width = 25,
  },

  renderer = {
    indent_markers = {
      enable = true,
      icons = {
        corner = "│",
        edge = "│",
        item = "│",
        bottom = " ",
        none = " ",
      },
    },

    icons = {
      show = {
        folder_arrow = false,
      },

      git_placement = "after",

      glyphs = {
        git = {
          unstaged = "M",
          staged = "S",
          unmerged = "U",
          renamed = "R",
          untracked = "?",
          deleted = "D",
          ignored = "I",
        },
      },
    },
  },
}
