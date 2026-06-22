-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- ⬇ This is where you actually apply your config choices.

-- Windows behavior
-- config.initial_cols = 60
-- config.initial_rows = 28
config.window_close_confirmation = 'NeverPrompt'

-- Font size & Color scheme
config.font_size = 16
config.font = wezterm.font 'CaskaydiaMono NF'
config.color_scheme = 'Apple System Colors'


config.set_environment_variables = {
  PATH = "/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin",
}

-- config.default_prog = { "tmux" }

-- ⬆ End of your config.


-- Finally, return the configuration to wezterm:
return config
