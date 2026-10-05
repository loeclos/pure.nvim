-- lua/pure/theme/plugins/nvim-tree.lua

---@type Pure.PluginSpec
return {
  name = "nvim-tree/nvim-tree.lua",
  lazy = { module = "nvim-tree" },

  highlights = function(c, config)
    local is_clear  = vim.tbl_contains(config.background_clear or {}, "nvim-tree")
    local transparent = config.transparent
    local sidebar_bg = transparent and "NONE" or (is_clear and c.editor.background or c.sideBar.background)
    local popup_bg = transparent and "NONE" or c.editorSuggestWidget.background

    -- stylua: ignore
    return {
      -- Base window
      NvimTreeNormal       = { fg = c.sideBar.foreground, bg = sidebar_bg },
      NvimTreeNormalFloat  = { fg = c.sideBar.foreground, bg = sidebar_bg },
      NvimTreeNormalNC     = { fg = c.base.dimmed2,       bg = sidebar_bg },
      NvimTreeEndOfBuffer  = { fg = sidebar_bg },
      NvimTreeVertSplit    = { fg = c.editor.background,  bg = c.editor.background },
      NvimTreeCursorLine   = { bg = c.list.activeSelectionBackground },
      NvimTreeCursorColumn = { bg = c.list.activeSelectionBackground },
      NvimTreeWinSeparator = { fg = is_clear and c.base.black or c.editor.background, bg = c.editor.background },

      -- Files & folders
      NvimTreeRootFolder        = { link = "PureGrey" },
      NvimTreeFolderIcon        = { link = "PureOrange" },
      NvimTreeFolderName        = { link = "PureGreen" },
      NvimTreeOpenedFolderName  = { link = "PureGreen" },
      NvimTreeEmptyFolderName   = { link = "PureGreen" },
      NvimTreeFileName          = { link = "PureFg" },
      NvimTreeFileIcon          = { link = "PureFg" },
      NvimTreeSpecialFile       = { link = "PureFg" },
      NvimTreeSymlink           = { link = "PureAqua" },
      NvimTreeSymlinkIcon       = { link = "PureFg" },
      NvimTreeSymlinkFolderName = { link = "PureGreen" },
      NvimTreeImageFile         = { link = "PureFg" },
      NvimTreeExecFile          = { link = "PureFg" },
      NvimTreeIndentMarker      = { link = "PureGrey" },

      -- Git status
      NvimTreeGitDirty   = { link = "PureYellow" },
      NvimTreeGitStaged  = { link = "PureBlue" },
      NvimTreeGitMerge   = { link = "PureOrange" },
      NvimTreeGitRenamed = { link = "PurePurple" },
      NvimTreeGitNew     = { link = "PureAqua" },
      NvimTreeGitDeleted = { link = "PureRed" },
      NvimTreeGitIgnored = { link = "PureGrey" },

      -- Diagnostics
      NvimTreeLspDiagnosticsError       = { link = "PureRedSign" },
      NvimTreeLspDiagnosticsWarning     = { link = "PureYellowSign" },
      NvimTreeLspDiagnosticsInformation = { link = "PureBlueSign" },
      NvimTreeLspDiagnosticsHint        = { link = "PureAquaSign" },

      -- Misc
      NvimTreePopup            = { fg = c.base.white,   bg = popup_bg },
      NvimTreeBookmark         = { link = "PurePurple" },
      NvimTreeLiveFilterPrefix = { link = "PureRed" },
      NvimTreeLiveFilterValue  = { fg = c.base.white, bold = true },
    }
  end,
}
