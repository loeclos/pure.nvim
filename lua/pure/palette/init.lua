-- lua/pure/palette/init.lua
-- Palette loader with cache.

---@class Pure.PaletteModule
local M = {}

---@type Pure.Palette|nil
local cache = nil

---@return Pure.Palette
function M.load()
  if cache then
    return cache
  end
  cache = require("pure.palette.pure")
  return cache
end

function M.clear_cache()
  cache = nil
end

return M
