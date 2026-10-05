-- lua/pure/init.lua
-- Public API for the Pure colorscheme.

---@class Pure
local M = {}

local config_module = require("pure.config")
local theme_module  = require("pure.theme")

--- Configure Pure without applying highlights.
--- Call this from your plugin manager's setup (e.g., lazy.nvim opts).
---@param user_config? Pure.Config
function M.setup(user_config)
  config_module.setup(user_config)

  local commands = require("pure.commands")
  commands.create()
end

--- Apply the colorscheme.
--- Called from colors/pure.lua automatically, or manually to reload.
function M.load()
  theme_module.load()
  vim.api.nvim_exec_autocmds("ColorScheme", { pattern = vim.g.colors_name })
end

--- Get the current configuration.
---@return Pure.Config
function M.get_config()
  return config_module.get()
end

--- Get the current color scheme (palette → scheme).
---@return Pure.Scheme
function M.get_scheme()
  return theme_module.get_scheme()
end

--- Get color utilities (blend, lighten, etc.).
---@return Pure.Colors
function M.get_colors()
  return require("pure.colors")
end

--- Get the Pure palette.
---@return Pure.Palette
function M.get_palette()
  return require("pure.palette").load()
end

return M
