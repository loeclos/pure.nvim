-- colors/pure.lua
-- Neovim colorscheme entry point.
-- Neovim sources this file when the user does `colorscheme pure`.

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.o.termguicolors = true
vim.g.colors_name   = "pure"

-- Stash the current user config before we purge package.loaded.
-- We use a plain _G global so the reference survives module eviction.
-- Function values (override, override_scheme) are preserved intact.
_G.__pure_saved_config = nil
if package.loaded["pure"] and type(package.loaded["pure"].get_config) == "function" then
  _G.__pure_saved_config = package.loaded["pure"].get_config()
end

-- Clear the module cache so edits to any pure.* module take effect immediately.
for k in pairs(package.loaded) do
  if k:match("^pure") then
    package.loaded[k] = nil
  end
end

-- Re-apply the saved config (if any) so highlights use the user's settings,
-- then load the colorscheme.
local ok, pure = pcall(require, "pure")
if ok then
  if _G.__pure_saved_config then
    pure.setup(_G.__pure_saved_config)
    _G.__pure_saved_config = nil
  end
  pure.load()
end
