-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- ⬇ This is where you actually apply your config choices.




config.initial_cols = 60
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 16
config.color_scheme = 'iTerm2 Dark Background'
config.font = wezterm.font 'CaskaydiaMono NF'

config.window_close_confirmation = 'NeverPrompt'

-- ⬆ End of your config.


-- Finally, return the configuration to wezterm:
return config
