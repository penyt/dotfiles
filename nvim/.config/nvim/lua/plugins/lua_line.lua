local custom_theme = require("lualine.themes.gruvbox_dark")

custom_theme.normal.a.bg = "#83a598"
custom_theme.insert.a.bg = "#b8bb26"
custom_theme.visual.a.bg = "#9d66b9"
custom_theme.command.a.bg = "#fabd2f"
-- custom_theme.visual.b.fg = "#9d66b9"

return {
  options = {
    theme = custom_theme,

    component_separators = {
      left = "│",
      right = "│",
    },

    section_separators = {
      left = "",
      right = "",
    },
  },
}
