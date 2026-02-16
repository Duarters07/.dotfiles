
--- Global Set ---

local options = {
    
    -- General
    mouse = "a",                            -- Enable mouse suport
    clipboard = "unnamedplus",              -- Use system clipboard
    swapfile = false,                       -- Disable Swap files
    backup = false,                         -- Disable backup files
    undofile = true,                        -- Enable persistent undo
    hidden = true,                          -- Allow switching buffers without saving
    scs = true,                             -- enable the "safe cursor"
    wildmenu = true,            


    -- UI
    number = true,                          -- Show line numbers
    relativenumber = true,                  -- Relative line numbers
    cursorline = true,                      -- Highlight current line
    termguicolors = true,                   -- True color support
    signcolumn = "yes",                     -- Always show sign column
    cmdheight = 2,                          -- More Space Neovim command line
    pumheight = 10,                         -- Pop up menu height
    showmode = true,                        -- Show actual mode Neovim
    numberwidth = 4,                        -- set number column width to 4
    wrap = true,                            -- display lines as one long line
    linebreak = true,                       -- companion to wrap, don't split words
    -- colorcolumn = "100",                 -- Draws a line at the given line


    -- Tabs & Indentation
    tabstop = 4,                            -- Number of spaces tabs count for
    shiftwidth = 4,                         -- Size of an indent
    expandtab = true,                       -- Convert tabs to spaces
    autoindent = true,                      -- Copy indent from current line when starting new one
    smartindent = true,                     -- Smart indenting


    -- Search
    ignorecase = true,                      -- Ignore case in searches
    smartcase = true,                       -- If search contains uppercase, don't ignore case
    incsearch = true,                       -- Show match while typing
    hlsearch = true,                        -- Highlight search matches


    -- Scrolling
    scrolloff = 8,                          -- Keep 8 lines above/below cursor
    sidescrolloff = 8,                      -- Keep 8 columns beside cursor


    -- Splits
    splitbelow = true,                      -- Horizontal splits go below
    splitright = true,                      -- Vertical splits go to the right


    -- Performance
    updatetime = 300,                       -- Faster completion
    timeoutlen = 500,                       -- Timeout length for mapped sequences


    -- Font
    fileencoding = "utf-8",                  -- the encoding written to a file
    guifont = "monospace:h17",               -- the font used
    whichwrap = "bs<>[]hl",                  -- which "horizontal" keys are allowed to travel to prev/next line
 }


for k, v in pairs(options) do
  vim.opt[k] = v
end
