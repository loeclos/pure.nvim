-- lua/pure/highlights/semantic.lua
-- Defines named intermediate groups (PureRed, PureErrorText, etc.) that
-- plugin highlight files link to, keeping them decoupled from raw colors.
local M = function(p, opts)
    opts = opts or {}

    local colors = {
        fg = p.text or p.fg0,
        grey = p.dimmed3 or p.grey0,
        red = p.accent1 or p.red,
        orange = p.accent2 or p.orange,
        yellow = p.accent3 or p.yellow,
        green = p.accent4 or p.green,
        aqua = p.accent5 or p.aqua or p.cyan,
        blue = p.blue,
        purple = p.accent6 or p.purple or p.violet,
        sign_bg = p.dimmed5 or p.bg1,
        current_word_bg = p.dimmed5 or p.bg2,
        inlay_bg = p.dark1 or p.bg1,
        bg_visual_red = p.bg_visual_red,
        bg_visual_yellow = p.bg_visual_yellow,
        bg_visual_green = p.bg_visual_green,
        bg_visual_blue = p.bg_visual_blue
    }

    local hl = vim.api.nvim_set_hl

    -- Color aliases 
    hl(0, "PureFg", {
        fg = colors.fg
    })
    hl(0, "PureGrey", {
        fg = colors.grey
    })
    hl(0, "PureRed", {
        fg = colors.red
    })
    hl(0, "PureOrange", {
        fg = colors.orange
    })
    hl(0, "PureYellow", {
        fg = colors.yellow
    })
    hl(0, "PureGreen", {
        fg = colors.green
    })
    hl(0, "PureAqua", {
        fg = colors.aqua
    })
    hl(0, "PureBlue", {
        fg = colors.blue
    })
    hl(0, "PurePurple", {
        fg = colors.purple
    })
    hl(0, "PureCyan", {
        fg = colors.aqua
    })
    hl(0, "PureViolet", {
        fg = colors.purple
    })

    -- Italic variants (respects italic_comments option)
    local italic = opts.italic_comments and true or false
    hl(0, "PureRedItalic", {
        fg = colors.red,
        italic = italic
    })
    hl(0, "PureYellowItalic", {
        fg = colors.yellow,
        italic = italic
    })
    hl(0, "PureGreenItalic", {
        fg = colors.green,
        italic = italic
    })
    hl(0, "PureAquaItalic", {
        fg = colors.aqua,
        italic = italic
    })
    hl(0, "PureBlueItalic", {
        fg = colors.blue,
        italic = italic
    })
    hl(0, "PurePurpleItalic", {
        fg = colors.purple,
        italic = italic
    })
    hl(0, "PureCyanItalic", {
        fg = colors.aqua,
        italic = italic
    })
    hl(0, "PureVioletItalic", {
        fg = colors.purple,
        italic = italic
    })

    -- Sign column colors 
    hl(0, "PureRedSign", {
        fg = colors.red,
        bg = colors.sign_bg
    })
    hl(0, "PureOrangeSign", {
        fg = colors.orange,
        bg = colors.sign_bg
    })
    hl(0, "PureYellowSign", {
        fg = colors.yellow,
        bg = colors.sign_bg
    })
    hl(0, "PureGreenSign", {
        fg = colors.green,
        bg = colors.sign_bg
    })
    hl(0, "PureAquaSign", {
        fg = colors.aqua,
        bg = colors.sign_bg
    })
    hl(0, "PureBlueSign", {
        fg = colors.blue,
        bg = colors.sign_bg
    })
    hl(0, "PurePurpleSign", {
        fg = colors.purple,
        bg = colors.sign_bg
    })
    hl(0, "PureCyanSign", {
        fg = colors.aqua,
        bg = colors.sign_bg
    })
    hl(0, "PureVioletSign", {
        fg = colors.purple,
        bg = colors.sign_bg
    })

    -- Diagnostic virtual text 
    -- "colored" = tinted bg wash; "grey" = muted uniform color
    local vt = opts.diagnostic_virtual_text
    if vt == "grey" then
        hl(0, "PureVirtualTextError", {
            link = "PureGrey"
        })
        hl(0, "PureVirtualTextWarning", {
            link = "PureGrey"
        })
        hl(0, "PureVirtualTextInfo", {
            link = "PureGrey"
        })
        hl(0, "PureVirtualTextHint", {
            link = "PureGrey"
        })
    else -- "colored" (default)
        hl(0, "PureVirtualTextError", {
            fg = colors.red,
            bg = colors.bg_visual_red
        })
        hl(0, "PureVirtualTextWarning", {
            fg = colors.yellow,
            bg = colors.bg_visual_yellow
        })
        hl(0, "PureVirtualTextInfo", {
            fg = colors.blue,
            bg = colors.bg_visual_blue
        })
        hl(0, "PureVirtualTextHint", {
            fg = colors.aqua,
            bg = colors.bg_visual_green
        })
    end

    -- Inline diagnostic text 
    hl(0, "PureErrorText", {
        undercurl = true,
        sp = colors.red
    })
    hl(0, "PureWarningText", {
        undercurl = true,
        sp = colors.yellow
    })
    hl(0, "PureInfoText", {
        undercurl = true,
        sp = colors.blue
    })
    hl(0, "PureHintText", {
        undercurl = true,
        sp = colors.aqua
    })

    -- Float diagnostic (no background, just color)
    hl(0, "PureErrorFloat", {
        fg = colors.red
    })
    hl(0, "PureWarningFloat", {
        fg = colors.yellow
    })
    hl(0, "PureInfoFloat", {
        fg = colors.blue
    })
    hl(0, "PureHintFloat", {
        fg = colors.aqua
    })

    -- Current word 
    hl(0, "PureCurrentWord", {
        bg = colors.current_word_bg
    })

    -- Inlay hints
    hl(0, "PureInlayHints", {
        fg = colors.grey,
        bg = colors.inlay_bg
    })
end

return M
