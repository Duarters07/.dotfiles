require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = { "bash", "lua", "vim", "vimdoc", "query", "regex",
        "c", "cpp", "c_sharp", "rust", "python",
    	"html", "css", "php", "javascript", "typescript", "sql"
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    highlight = {
        enable = true,

        -- disable = { "latex"},

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = true,
    },

      rainbow = {
        enable = true,
        -- list of languages you want to disable the plugin for
        disable = { 'jsx'} ,
        -- Which query to use for finding delimiters
        query = 'rainbow-parens',
        -- Highlight the entire buffer all at once
        strategy = require('ts-rainbow').strategy.global,
    }
}
