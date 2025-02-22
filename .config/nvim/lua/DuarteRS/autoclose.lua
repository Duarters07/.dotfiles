require("autoclose").setup({
    keys = {
        ["("] = { escape = false, close = true, pair = "()", disabled_filetypes = {} },
        ["["] = { escape = false, close = true, pair = "[]", disabled_filetypes = {} },
        ["{"] = { escape = false, close = true, pair = "{}", disabled_filetypes = {} },

        [">"] = { escape = true, close = false, pair = "<>", disabled_filetypes = {} },
        [")"] = { escape = true, close = false, pair = "()", disabled_filetypes = {} },
        ["]"] = { escape = true, close = false, pair = "[]", disabled_filetypes = {} },
        ["}"] = { escape = true, close = false, pair = "{}", disabled_filetypes = {} },

        ['"'] = { escape = true, close = true, pair = '""', disabled_filetypes = {"gitcommit"} },
        ["'"] = { escape = true, close = true, pair = "''", disabled_filetypes = {"gitcommit"} },
        ["`"] = { escape = true, close = true, pair = "``", disabled_filetypes = {"gitcommit", "tex"} },

        ["$"] = { escape = true, close = true, pair = "$$", enabled_filetypes = {"tex"} },
    },
    options = {
        disabled_filetypes = { "text" },
        disable_when_touch = false,
        pair_spaces = false,
        auto_indent = true,
    },
})
