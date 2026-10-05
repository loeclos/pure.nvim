-- lua/pure/config/defaults.lua
-- Type annotations and default values for Pure's configuration.

---@class Pure.Config.Styles
---@field comment?   vim.api.keyset.highlight
---@field keyword?   vim.api.keyset.highlight
---@field type?      vim.api.keyset.highlight
---@field parameter? vim.api.keyset.highlight

---@class Pure.Config.Plugins.Bufferline
---@field underline_selected? boolean
---@field underline_visible?  boolean
---@field underline_fill?     boolean
---@field bold?               boolean

---@class Pure.Config.Plugins
---@field bufferline? Pure.Config.Plugins.Bufferline

---@class Pure.Config
---@field transparent?              boolean
---@field terminal_colors?          boolean
---@field styles?                   Pure.Config.Styles
---@field diagnostic_virtual_text?  "colored"|"grey"
---@field background_clear?         string[]     Plugin names that should have bg cleared
---@field disabled_plugins?         string[]     Plugin names to skip highlight generation for
---@field plugins?                  Pure.Config.Plugins
---@field override?                 fun(scheme: Pure.Scheme): table<string, vim.api.keyset.highlight>
---@field override_scheme?          fun(scheme: Pure.Scheme, palette: Pure.Palette, colors: Pure.Colors): Pure.Scheme

---@type Pure.Config
local defaults = {
  transparent             = false,
  terminal_colors         = true,
  styles = {
    comment   = { italic = true },
    keyword   = { italic = false },
    type      = { italic = true },
    parameter = { italic = false },
  },
  diagnostic_virtual_text = "colored",
  background_clear        = {},
  disabled_plugins        = {},
  plugins = {
    bufferline = {
      underline_selected = false,
      underline_visible  = false,
      underline_fill     = false,
      bold               = true,
    },
  },
  override        = nil,
  override_scheme = nil,
}

return defaults
