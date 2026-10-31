local highlight = {
  -- "RainbowRed",
  "RainbowYellow",
  "RainbowBlue",
  "RainbowGreen",
}

local hooks = require("ibl.hooks")

hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  -- vim.api.nvim_set_hl(0, "RainbowRed", {
  --   fg = "#665C54",
  --   bg = "#382B30",
  -- })

  vim.api.nvim_set_hl(0, "RainbowYellow", {
    fg = "#665C54",
    bg = "#38352B",
  })

  vim.api.nvim_set_hl(0, "RainbowBlue", {
    fg = "#665C54",
    bg = "#29343D",
  })

  vim.api.nvim_set_hl(0, "RainbowGreen", {
    fg = "#665C54",
    bg = "#2D382F",
  })
end)

return {
  indent = {
    char = "▏",
    highlight = highlight,
  },
  whitespace = {
    highlight = highlight,
    remove_blankline_trail = false,
  },
  scope = {
    enabled = false,
  },
}
