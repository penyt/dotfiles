local colors = {
  -- Headings
  h1 = "#f37b84",
  h2 = "#ffb88c",
  h3 = "#ffea8c",
  h4 = "#59d5c4",
  h5 = "#66abff",
  h6 = "#b99aff",

  -- Text
  bold = "#ffffff",
  italic = "#ffa953",
  code = "#f37b84",
  del = "#ad5a5a",
  link = "#c38fff",
  list = "#fabd2f",

  -- Background
  heading_bg = "#3c3836",
  code_bg = "#32302f",
}

local function setup_highlights()
  local hl = vim.api.nvim_set_hl

  -- Headings
  for i = 1, 6 do
    local color = colors["h" .. i]

    hl(0, "RenderMarkdownH" .. i, {
      fg = color,
      bold = true,
    })

    hl(0, "RenderMarkdownH" .. i .. "Bg", {
      fg = color,
      bg = colors.heading_bg,
      bold = true,
    })

    hl(0, "@markup.heading." .. i .. ".markdown", {
      fg = color,
      bold = true,
    })
  end

  -- Bold
  hl(0, "@markup.strong.markdown_inline", {
    fg = colors.bold,
    bold = true,
  })

  -- Italic
  hl(0, "@markup.italic.markdown_inline", {
    fg = colors.italic,
    italic = true,
  })

  -- Strikethrough
  hl(0, "@markup.strikethrough.markdown_inline", {
    fg = colors.del,
    strikethrough = true,
  })

  -- Inline code
  hl(0, "RenderMarkdownCodeInline", {
    fg = colors.code,
    bg = colors.code_bg,
  })

  hl(0, "@markup.raw.markdown_inline", {
    fg = colors.code,
    bg = colors.code_bg,
  })

  -- Links
  hl(0, "@markup.link.label.markdown_inline", {
    fg = colors.link,
    underline = true,
  })

  hl(0, "@markup.link.url.markdown_inline", {
    fg = colors.link,
    underline = true,
  })

  -- List bullets & numbers
  hl(0, "RenderMarkdownBullet", {
    fg = colors.list,
    bold = true,
  })

  -- Raw Markdown list markers
  hl(0, "@markup.list.markdown", {
    fg = colors.list,
    bold = true,
  })

  hl(0, "@markup.list.numbered.markdown", {
    fg = colors.list,
    bold = true,
  })

  hl(0, "@markup.list.unnumbered.markdown", {
    fg = colors.list,
    bold = true,
  })
end

-- Reapply highlights when colorscheme changes
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = setup_highlights,
})

setup_highlights()

return {
  anti_conceal = {
    ignore = {
      head_background = true,
      code_background = true,
      indent = true,
      sign = true,
      virtual_lines = true,
    },
  },

  heading = {
    sign = false,

    icons = {
      "# ",
      "## ",
      "### ",
      "󰲧 ",
      "󰲩 ",
      "󰲫 ",
    },

    width = "block",
    left_pad = 1,
    right_pad = 3,
  },

  code = {
    style = "normal",
    conceal_delimiters = false,
    background_inset = 0,
    border = "none",
  },
}
