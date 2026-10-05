-- lua/pure/theme/groups/semantic.lua
-- Named intermediate groups (PureRed, PureErrorText, etc.) and @lsp.type.* tokens.
-- Plugin files link to these instead of referencing raw palette colors.

---@type Pure.GroupSpec
return {
  name = "semantic",

  highlights = function(scheme, config)
    -- stylua: ignore
    return {
      -- Color aliases
      PureFg     = { fg = scheme.base.white },
      PureGrey   = { fg = scheme.base.dimmed3 },
      PureRed    = { fg = scheme.base.red },
      PureOrange = { fg = scheme.base.orange },
      PureYellow = { fg = scheme.base.yellow },
      PureGreen  = { fg = scheme.base.green },
      PureAqua   = { fg = scheme.base.aqua },
      PureBlue   = { fg = scheme.base.blue },
      PurePurple = { fg = scheme.base.purple },
      PureCyan   = { fg = scheme.base.aqua },
      PureViolet = { fg = scheme.base.purple },

      -- Sign column variants
      PureRedSign    = { fg = scheme.base.red,     bg = scheme.base.dimmed5 },
      PureOrangeSign = { fg = scheme.base.orange,  bg = scheme.base.dimmed5 },
      PureYellowSign = { fg = scheme.base.yellow,  bg = scheme.base.dimmed5 },
      PureGreenSign  = { fg = scheme.base.green,   bg = scheme.base.dimmed5 },
      PureAquaSign   = { fg = scheme.base.aqua,    bg = scheme.base.dimmed5 },
      PureBlueSign   = { fg = scheme.base.blue,    bg = scheme.base.dimmed5 },
      PurePurpleSign = { fg = scheme.base.purple,  bg = scheme.base.dimmed5 },
      PureCyanSign   = { fg = scheme.base.aqua,    bg = scheme.base.dimmed5 },
      PureVioletSign = { fg = scheme.base.purple,  bg = scheme.base.dimmed5 },

      -- Inline diagnostic undercurl
      PureErrorText   = { undercurl = true, sp = scheme.inputValidation.errorBorder },
      PureWarningText = { undercurl = true, sp = scheme.inputValidation.warningBorder },
      PureInfoText    = { undercurl = true, sp = scheme.inputValidation.infoBorder },
      PureHintText    = { undercurl = true, sp = scheme.inputValidation.infoBorder },

      -- Float diagnostic
      PureErrorFloat   = { fg = scheme.inputValidation.errorForeground },
      PureWarningFloat = { fg = scheme.inputValidation.warningForeground },
      PureInfoFloat    = { fg = scheme.inputValidation.infoForeground },
      PureHintFloat    = { fg = scheme.inputValidation.infoForeground },

      -- Virtual text diagnostic
      PureVirtualTextError   = { bg = scheme.errorLens.errorBackground,   fg = scheme.errorLens.errorForeground },
      PureVirtualTextWarning = { bg = scheme.errorLens.warningBackground, fg = scheme.errorLens.warningForeground },
      PureVirtualTextInfo    = { bg = scheme.errorLens.infoBackground,    fg = scheme.errorLens.infoForeground },
      PureVirtualTextHint    = { bg = scheme.errorLens.hintBackground,    fg = scheme.errorLens.hintForeground },

      -- Misc
      PureCurrentWord = { bg = scheme.editor.wordHighlightBackground },
      PureInlayHints  = { bg = scheme.editorInlayHint.background, fg = scheme.editorInlayHint.foreground },

      -- LSP semantic tokens
      -- Go readability fix: types -> yellow, funcs -> orange, keywords -> red,
      -- so they are all distinct from variables (white/aqua).
      ["@lsp.type.boolean"]              = { fg = scheme.base.purple },
      ["@lsp.type.builtinType"]          = { fg = scheme.base.yellow },
      ["@lsp.type.class"]                = { fg = scheme.base.yellow },
      ["@lsp.type.comment"]              = { link = "@comment" },
      ["@lsp.type.decorator"]            = { link = "@attribute" },
      ["@lsp.type.deriveHelper"]         = { link = "@attribute" },
      ["@lsp.type.enum"]                 = { fg = scheme.base.yellow },
      ["@lsp.type.enumMember"]           = { fg = scheme.base.purple },
      ["@lsp.type.escapeSequence"]       = { link = "@string.escape" },
      ["@lsp.type.formatSpecifier"]      = { link = "@markup.list" },
      ["@lsp.type.function"]             = { fg = scheme.base.orange },
      ["@lsp.type.generic"]              = { link = "@variable" },
      ["@lsp.type.interface"]            = { fg = scheme.base.yellow },
      ["@lsp.type.keyword"]              = { fg = scheme.base.red },
      ["@lsp.type.lifetime"]             = { link = "@keyword.storage" },
      ["@lsp.type.macro"]                = { fg = scheme.base.orange },
      ["@lsp.type.method"]               = { fg = scheme.base.orange },
      ["@lsp.type.namespace"]            = { fg = scheme.base.yellow },
      ["@lsp.type.namespace.python"]     = { link = "@variable" },
      ["@lsp.type.number"]               = { fg = scheme.base.purple },
      ["@lsp.type.operator"]             = { fg = scheme.base.green },
      ["@lsp.type.parameter"]            = { fg = scheme.base.aqua },
      ["@lsp.type.property"]             = { fg = scheme.base.white },
      ["@lsp.type.selfKeyword"]          = { link = "@variable.builtin" },
      ["@lsp.type.selfTypeKeyword"]      = { link = "@variable.builtin" },
      ["@lsp.type.string"]               = { link = "@string" },
      ["@lsp.type.struct"]               = { fg = scheme.base.yellow },
      ["@lsp.type.type"]                 = { fg = scheme.base.yellow },
      ["@lsp.type.typeAlias"]            = { link = "@type.definition" },
      ["@lsp.type.typeParameter"]        = { fg = scheme.base.yellow },
      ["@lsp.type.unresolvedReference"]  = { undercurl = true, sp = scheme.base.red },
      ["@lsp.type.variable"]             = { fg = scheme.base.white },

      -- Type modifiers
      ["@lsp.typemod.class.defaultLibrary"]      = { fg = scheme.base.yellow },
      ["@lsp.typemod.enum.defaultLibrary"]       = { fg = scheme.base.yellow },
      ["@lsp.typemod.enumMember.defaultLibrary"] = { fg = scheme.base.purple },
      ["@lsp.typemod.function.defaultLibrary"]   = { fg = scheme.base.orange },
      ["@lsp.typemod.keyword.async"]             = { link = "@keyword.coroutine" },
      ["@lsp.typemod.keyword.injected"]          = { fg = scheme.base.red },
      ["@lsp.typemod.macro.defaultLibrary"]      = { fg = scheme.base.orange },
      ["@lsp.typemod.method.defaultLibrary"]     = { fg = scheme.base.orange },
      ["@lsp.typemod.operator.injected"]         = { fg = scheme.base.green },
      ["@lsp.typemod.string.injected"]           = { link = "@string" },
      ["@lsp.typemod.struct.defaultLibrary"]     = { fg = scheme.base.yellow },
      ["@lsp.typemod.type.defaultLibrary"]       = { fg = scheme.base.yellow },
      ["@lsp.typemod.typeAlias.defaultLibrary"]  = { fg = scheme.base.yellow },
      ["@lsp.typemod.variable.callable"]         = { fg = scheme.base.orange },
      ["@lsp.typemod.variable.defaultLibrary"]   = { fg = scheme.base.white },
      ["@lsp.typemod.variable.injected"]         = { fg = scheme.base.white },
      ["@lsp.typemod.variable.static"]           = { fg = scheme.base.white },
    }
  end,

  extra = function(scheme, config)
    return {
      SPNormalFloat = { bg = scheme.editorSuggestWidget.background, fg = scheme.editorSuggestWidget.foreground },
      SPFloatBorder = { bg = scheme.editor.background, fg = scheme.editorSuggestWidget.background },
      SPCursorLine  = { bg = scheme.editorLineNumber.foreground, fg = scheme.base.yellow, bold = true },
      SPTitle       = { bg = scheme.base.yellow, fg = scheme.base.black, bold = true },
    }
  end,
}
