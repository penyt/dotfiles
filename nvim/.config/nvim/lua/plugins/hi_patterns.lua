local hipatterns = require("mini.hipatterns")

local colors = {
  TODO = { fg = "#FFFFFF", bg = "#FF9B06" },
  NOTE = { fg = "#000000", bg = "#FFF306" },
  DEBUG = { fg = "#000000", bg = "#41D9FF" },
  BUG = { fg = "#000000", bg = "#41FF67" },
  HACK = { fg = "#FFFFFF", bg = "#8B5CF6" },
  FIXME = { fg = "#FFFFFF", bg = "#FF4141" },
}

local highlighters = {}

for name, color in pairs(colors) do
  local group = "MiniHipatterns" .. name

  vim.api.nvim_set_hl(0, group, {
    fg = color.fg,
    bg = color.bg,
    bold = true,
  })

  highlighters[name:lower()] = {
    pattern = "%f[%w]()" .. name .. "()%f[%W]",
    group = group,
  }
end

return {
  highlighters = highlighters,
}
