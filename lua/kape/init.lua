-- lua/kape/init.lua (backward-compat shim)
-- `require("kape")` still works after the rename; new code should use `require("pure")`.
return require("pure")
