local wezterm = require 'wezterm'
local config = {}

-- Ubesluttsom color scheme for WezTerm - matching Neovim colors exactly
local ubesluttsom_dark = {
  -- Terminal colors (0-15) - syntax colors
  ansi = {
    '#111111', -- black (bg_alt)
    '#a85454', -- red
    '#6b9070', -- green
    '#b8a965', -- yellow
    '#6581a0', -- blue
    '#9a7ca8', -- magenta
    '#7b9aaa', -- cyan
    '#e5e5e5', -- white (fg_alt)
  },
  brights = {
    '#363636', -- bright black (bg_search)
    '#c76868', -- bright red
    '#7fa384', -- bright green
    '#c9ba7a', -- bright yellow
    '#7a95b3', -- bright blue
    '#ad8fbb', -- bright magenta
    '#8ea7b5', -- bright cyan
    '#ffffff', -- bright white (fg)
  },

  -- UI colors - pure grayscale matching Neovim
  foreground = '#ffffff',   -- fg
  background = '#000000',   -- bg (nil -> black)
  cursor_bg = '#ffffff',    -- fg
  cursor_fg = '#000000',    -- bg
  cursor_border = '#ffffff',
  selection_fg = '#000000', -- bg
  selection_bg = '#ffffff', -- fg (reverse)
  scrollbar_thumb = '#363636', -- bg_search
  split = '#262626',        -- bg_visual
}

local ubesluttsom_light = {
  -- Terminal colors (0-15) - syntax colors
  ansi = {
    '#f5f5f5', -- black (bg_alt)
    '#a04347', -- red
    '#52774e', -- green
    '#8a7a3d', -- yellow
    '#4a6b85', -- blue
    '#6b5577', -- magenta
    '#4a737a', -- cyan
    '#333333', -- white (fg_alt)
  },
  brights = {
    '#c0c0c0', -- bright black (bg_search)
    '#b85459', -- bright red
    '#6b9070', -- bright green
    '#a5944a', -- bright yellow
    '#5e809b', -- bright blue
    '#7f698d', -- bright magenta
    '#5e878f', -- bright cyan
    '#000000', -- bright white (fg)
  },

  -- UI colors - pure grayscale matching Neovim
  foreground = '#000000',   -- fg
  background = '#ffffff',   -- bg (nil -> white)
  cursor_bg = '#000000',    -- fg
  cursor_fg = '#ffffff',    -- bg
  cursor_border = '#000000',
  selection_fg = '#ffffff', -- bg
  selection_bg = '#000000', -- fg (reverse)
  scrollbar_thumb = '#c0c0c0', -- bg_search
  split = '#d0d0d0',        -- bg_visual
}

local function get_appearance()
    if wezterm.gui then
        return wezterm.gui.get_appearance()
    end
    return 'Dark'
end

local function scheme_for_appearance(appearance)
    if appearance:find 'Dark' then
        return ubesluttsom_dark
    else
        return ubesluttsom_light
    end
end

local function font_for_appearance(appearance)
    if appearance:find 'Dark' then
        return wezterm.font('IosevkaTerm Nerd Font', { weight = 'Light' })
    else
        return wezterm.font('IosevkaTerm Nerd Font', { weight = 'Regular' })
    end
end

config.font = font_for_appearance(get_appearance())

-- Use our custom ubesluttsom color scheme
local current_scheme = scheme_for_appearance(get_appearance())
config.colors = current_scheme

config.window_padding = {
  left = '2cell',
  right = '2cell',
  top = '0.5cell',
  bottom = '0.5cell',
}
-- tab bar padding:
config.tab_bar_padding = {
  left = '1cell',
  right = '1cell',
}

config.enable_tab_bar = true
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false

-- Tab bar styling using pure grayscale UI colors (not ANSI)
config.colors.tab_bar = {
  background = current_scheme.background,

  active_tab = {
    bg_color = current_scheme.background,
    fg_color = get_appearance():find('Dark') and '#262626' or '#d0d0d0', -- bg_visual
    intensity = 'Bold',
    underline = 'None',
    italic = true,
    strikethrough = false,
  },

  inactive_tab = {
    bg_color = current_scheme.background,
    fg_color = get_appearance():find('Dark') and '#202020' or '#e8e8e8', -- bg_subtle
  },

  inactive_tab_hover = {
    bg_color = current_scheme.background,
    fg_color = get_appearance():find('Dark') and '#262626' or '#d0d0d0', -- bg_visual
    underline = 'Single',
  },

  new_tab = {
    bg_color = current_scheme.background,
    fg_color = get_appearance():find('Dark') and '#202020' or '#e8e8e8', -- bg_subtle
  },

  new_tab_hover = {
    bg_color = current_scheme.background,
    fg_color = get_appearance():find('Dark') and '#262626' or '#d0d0d0', -- bg_visual
    italic = true,
  },
}

config.inactive_pane_hsb = {
  saturation = 0.9,
  brightness = 0.8,
}

return config
