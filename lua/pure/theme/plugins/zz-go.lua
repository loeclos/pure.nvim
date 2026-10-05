-- lua/pure/theme/plugins/zz-go.lua
-- Go readability overrides (loads last alphabetically, so it wins).
-- Ensures types / keywords ("instructions") / functions are distinct
-- from variables, whether they come from treesitter or gopls semantic tokens.
--
-- Final Go palette:
--   variables / params / fields : white (#d4be98) / aqua (#689d8a)
--   types (struct/interface/etc) : yellow (#e7bb5c)
--   functions / methods          : orange (#c87941)
--   keywords (func/if/for/...)   : red (#b53535)
-- This applies globally too, since Go uses generic captures.

---@type Pure.PluginSpec
return {
  name = "go-readability",

  highlights = function(scheme, config)
    local styles = config.styles or {}
    local italic_type = styles.type and styles.type.italic

    -- stylua: ignore
    return {
      -- Treesitter: types (incl. Go-specific captures if present)
      ["@type"]                   = { fg = scheme.base.yellow, italic = italic_type },
      ["@type.builtin"]           = { fg = scheme.base.yellow, italic = italic_type },
      ["@type.definition"]        = { fg = scheme.base.yellow, italic = italic_type },
      ["@type.go"]                 = { fg = scheme.base.yellow, italic = italic_type },
      ["@type.builtin.go"]        = { fg = scheme.base.yellow, italic = italic_type },

      -- Treesitter: functions / methods
      ["@function"]               = { fg = scheme.base.orange },
      ["@function.call"]          = { fg = scheme.base.orange },
      ["@function.method"]        = { fg = scheme.base.orange },
      ["@function.method.call"]   = { fg = scheme.base.orange },
      ["@constructor"]            = { fg = scheme.base.orange },

      -- Treesitter: keywords ("instructions": func, if, for, switch, return, ...)
      ["@keyword"]                = { fg = scheme.base.red },
      ["@keyword.function"]       = { fg = scheme.base.red },
      ["@keyword.return"]         = { fg = scheme.base.red },
      ["@keyword.conditional"]    = { fg = scheme.base.red },
      ["@keyword.repeat"]         = { fg = scheme.base.red },
      ["@keyword.import"]         = { fg = scheme.base.red },
      ["@keyword.exception"]      = { fg = scheme.base.red },

      -- Treesitter: variables stay aqua/white
      ["@variable"]               = { fg = scheme.base.aqua },
      ["@variable.parameter"]     = { fg = scheme.base.aqua },
      ["@variable.member"]        = { fg = scheme.base.white },
      ["@property"]               = { fg = scheme.base.white },

      -- gopls semantic tokens (incl. .go-suffixed variants, just in case)
      ["@lsp.type.type"]                 = { fg = scheme.base.yellow },
      ["@lsp.type.type.go"]              = { fg = scheme.base.yellow },
      ["@lsp.type.struct"]               = { fg = scheme.base.yellow },
      ["@lsp.type.struct.go"]            = { fg = scheme.base.yellow },
      ["@lsp.type.interface"]            = { fg = scheme.base.yellow },
      ["@lsp.type.class"]                = { fg = scheme.base.yellow },
      ["@lsp.type.enum"]                 = { fg = scheme.base.yellow },
      ["@lsp.type.builtinType"]          = { fg = scheme.base.yellow },
      ["@lsp.type.namespace"]            = { fg = scheme.base.yellow },
      ["@lsp.type.typeParameter"]        = { fg = scheme.base.yellow },
      ["@lsp.type.function"]             = { fg = scheme.base.orange },
      ["@lsp.type.function.go"]          = { fg = scheme.base.orange },
      ["@lsp.type.method"]               = { fg = scheme.base.orange },
      ["@lsp.type.method.go"]            = { fg = scheme.base.orange },
      ["@lsp.type.keyword"]              = { fg = scheme.base.red },
      ["@lsp.type.variable"]             = { fg = scheme.base.white },
      ["@lsp.type.variable.go"]          = { fg = scheme.base.white },
      ["@lsp.type.parameter"]            = { fg = scheme.base.aqua },
      ["@lsp.type.parameter.go"]         = { fg = scheme.base.aqua },
      ["@lsp.type.property"]             = { fg = scheme.base.white },
    }
  end,
}
