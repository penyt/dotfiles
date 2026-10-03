local indentscope = require("mini.indentscope")

vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", {
  link = "DiagnosticInfo",
})

return {
  symbol = "▎",

  draw = {
    delay = 0,
    animation = indentscope.gen_animation.none(),
  },
}
