-- lua/pure/commands.lua
-- User commands for the Pure colorscheme.

---@class Pure.Commands
local M = {}

--- Create Pure user commands
function M.create()
  local cmd = vim.api.nvim_create_user_command

  -- PureReload: reload the colorscheme (useful during development)
  cmd("PureReload", function()
    require("pure").load()
  end, {
    desc  = "Reload the Pure colorscheme",
    nargs = 0,
  })

  -- PureInfo: print current config
  cmd("PureInfo", function()
    local config = require("pure.config").get()
    vim.notify(vim.inspect(config), vim.log.levels.INFO, { title = "Pure Config" })
  end, {
    desc  = "Show the current Pure configuration",
    nargs = 0,
  })

  -- Backward-compat aliases for the old kape name
  cmd("KapeReload", function()
    require("pure").load()
  end, {
    desc  = "Reload the Pure colorscheme (legacy alias)",
    nargs = 0,
  })
  cmd("KapeInfo", function()
    local config = require("pure.config").get()
    vim.notify(vim.inspect(config), vim.log.levels.INFO, { title = "Pure Config" })
  end, {
    desc  = "Show the current Pure configuration (legacy alias)",
    nargs = 0,
  })
end

return M
