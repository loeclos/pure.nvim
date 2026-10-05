-- lua/pure/theme/plugins/gitsigns.lua

---@type Pure.PluginSpec
return {
  name = "lewis6991/gitsigns.nvim",
  lazy = { module = "gitsigns" },

  highlights = function(scheme, config)
    -- stylua: ignore
    return {
      SignAdd    = { fg = scheme.editorGutter.addedBackground },
      SignChange = { fg = scheme.editorGutter.modifiedBackground },
      SignDelete = { fg = scheme.editorGutter.deletedBackground },

      GitSignsAdd              = { link = "PureGreenSign" },
      GitSignsChange           = { link = "PureBlueSign" },
      GitSignsDelete           = { link = "PureRedSign" },
      GitSignsAddNr            = { link = "PureGreen" },
      GitSignsChangeNr         = { link = "PureBlue" },
      GitSignsDeleteNr         = { link = "PureRed" },
      GitSignsAddLn            = { link = "DiffAdd" },
      GitSignsChangeLn         = { link = "DiffChange" },
      GitSignsDeleteLn         = { link = "DiffDelete" },
      GitSignsCurrentLineBlame = { fg = scheme.base.dimmed4 },
      GitSignsAddInline        = { link = "DiffAdd" },
      GitSignsChangeInline     = { link = "DiffChange" },
      GitSignsDeleteInline     = { link = "DiffDelete" },
    }
  end,
}
