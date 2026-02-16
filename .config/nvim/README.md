# DuarteRS Neovim Configuration

A fully customized Neovim setup built around **lazy.nvim** as the plugin manager, featuring LSP integration, intelligent autocompletion, fuzzy finding, Git integration, a rich UI, and much more. This configuration is designed for full-stack web development (JavaScript/TypeScript, Svelte, HTML/CSS, GraphQL, Python, Lua, C/C++) with a strong focus on productivity and aesthetics.

---

## Table of Contents

- [Project Structure](#project-structure)
- [How It All Loads](#how-it-all-loads)
- [Core Configuration](#core-configuration)
  - [Options](#options-luaduarterscoreoptionslua)
  - [Plugin Manager (lazy.nvim)](#plugin-manager-lazynvim-luaduarterscorepluginslua)
  - [Keymaps](#keymaps-luaduarterscorekeymapslua)
- [Plugins (In-Depth)](#plugins-in-depth)
  - [Colorscheme - TokyoNight](#1-colorscheme---tokyonight)
  - [Telescope - Fuzzy Finder](#2-telescope---fuzzy-finder)
  - [Lualine - Statusline](#3-lualine---statusline)
  - [NvimTree - File Explorer](#4-nvimtree---file-explorer)
  - [Bufferline](#5-bufferline)
  - [Barbar - Buffer Tabs](#6-barbar---buffer-tabs)
  - [Which-Key - Keybinding Helper](#7-which-key---keybinding-helper)
  - [Autoclose - Auto Pair Brackets](#8-autoclose---auto-pair-brackets)
  - [Mason - LSP/Tool Installer](#9-mason---lsptool-installer)
  - [LSP Configuration](#10-lsp-configuration)
  - [nvim-cmp - Autocompletion](#11-nvim-cmp---autocompletion)
  - [Treesitter - Syntax Highlighting](#12-treesitter---syntax-highlighting)
  - [Treesitter Context](#13-treesitter-context)
  - [Rainbow Delimiters](#14-rainbow-delimiters)
  - [Trouble - Diagnostics Panel](#15-trouble---diagnostics-panel)
  - [Gitsigns - Git Integration](#16-gitsigns---git-integration)
  - [ToggleTerm - Terminal](#17-toggleterm---integrated-terminal)
  - [Alpha - Dashboard](#18-alpha---dashboard)
  - [nvim-notify - Notifications](#19-nvim-notify---notifications)
  - [Comment.nvim - Commenting](#20-commentnvim---commenting)
  - [Conform - Code Formatting](#21-conform---code-formatting)
  - [nvim-surround](#22-nvim-surround)
  - [Dressing.nvim - Improved UI](#23-dressingnvim---improved-ui)
- [Complete Keymap Reference](#complete-keymap-reference)
  - [General / Neovim Defaults](#general--neovim-defaults)
  - [File Explorer (NvimTree)](#file-explorer-nvimtree)
  - [Telescope (Fuzzy Finding)](#telescope-fuzzy-finding)
  - [Buffers (Barbar)](#buffers-barbar)
  - [Buffers (Bufferline)](#buffers-bufferline)
  - [LSP](#lsp)
  - [Autocompletion (nvim-cmp)](#autocompletion-nvim-cmp)
  - [Treesitter](#treesitter)
  - [Git (Gitsigns)](#git-gitsigns)
  - [Diagnostics (Trouble)](#diagnostics-trouble)
  - [Terminal (ToggleTerm)](#terminal-toggleterm)
  - [Formatting (Conform)](#formatting-conform)
  - [Commenting (Comment.nvim)](#commenting-commentnvim)
- [Neovim Default Keybindings Reference](#neovim-default-keybindings-reference)
- [LSP Servers & Formatters](#lsp-servers--formatters)

---

## Project Structure

```
~/.config/nvim/
├── init.lua                          # Entry point - loads core/init.lua
├── .stylua.toml                      # StyLua formatter config (2-space indent)
├── lazy-lock.json                    # Lazy.nvim lockfile (pinned plugin versions)
│
└── lua/
    └── DuarteRS/
        ├── core/
        │   ├── init.lua              # Core loader - requires options, plugins, and all plugin configs
        │   ├── options.lua           # Neovim options (UI, tabs, search, scrolling, splits, etc.)
        │   ├── keymaps.lua           # Custom keymaps (currently empty - keymaps live in plugin files)
        │   └── plugins.lua           # lazy.nvim bootstrap + plugin declarations
        │
        └── plugins/
            ├── alpha.lua             # Dashboard / start screen
            ├── autoclose.lua         # Auto-close brackets, quotes, etc.
            ├── barbar.lua            # Tab/buffer bar with keymaps
            ├── bufferline.lua        # Alternative buffer line (also loaded)
            ├── colorschemes.lua      # TokyoNight theme + transparent background
            ├── comment.lua           # Toggle comments with treesitter context
            ├── formatting.lua        # Conform.nvim auto-formatting config
            ├── gitsigns.lua          # Git signs in gutter + git keymaps
            ├── lsp.lua               # LSP keymaps + diagnostic config (active)
            ├── lualine.lua           # Statusline configuration
            ├── mason.lua             # Mason + mason-lspconfig + tool installer setup
            ├── notify.lua            # nvim-notify notification system
            ├── nvim-cmp.lua          # Autocompletion engine config
            ├── nvim-tree.lua         # File explorer config + keymaps
            ├── rainbow-delimiters.lua # Rainbow-colored brackets
            ├── telescope.lua         # Fuzzy finder config + keymaps
            ├── temp_lsp.lua          # Alternative/backup LSP config (also loaded)
            ├── toggleterm.lua        # Floating terminal config + keymaps
            ├── treesitter.lua        # Treesitter parsers + highlight config
            ├── treesitter-context.lua # Sticky function/class context header
            ├── trouble.lua           # Diagnostics list panel + keymaps
            └── which-key.lua         # Keybinding popup helper config
```

---

## How It All Loads

The loading chain works as follows:

```
init.lua
  └── require("DuarteRS.core.init")
        ├── require("DuarteRS.core.options")        -- Set all vim.opt values
        ├── require("DuarteRS.core.plugins")         -- Bootstrap lazy.nvim + declare all plugins
        ├── require("DuarteRS.plugins.colorschemes") -- Apply theme first
        ├── require("DuarteRS.plugins.telescope")
        ├── require("DuarteRS.plugins.lualine")
        ├── require("DuarteRS.plugins.nvim-tree")
        ├── require("DuarteRS.plugins.bufferline")
        ├── require("DuarteRS.plugins.which-key")
        ├── require("DuarteRS.plugins.autoclose")
        ├── require("DuarteRS.plugins.mason")        -- Mason before LSP
        ├── require("DuarteRS.plugins.lsp")
        ├── require("DuarteRS.plugins.treesitter")
        ├── require("DuarteRS.plugins.treesitter-context")
        ├── require("DuarteRS.plugins.trouble")
        ├── require("DuarteRS.plugins.rainbow-delimiters")
        ├── require("DuarteRS.plugins.barbar")
        ├── require("DuarteRS.plugins.gitsigns")
        ├── require("DuarteRS.plugins.toggleterm")
        ├── require("DuarteRS.plugins.notify")
        ├── require("DuarteRS.plugins.alpha")
        ├── require("DuarteRS.plugins.nvim-cmp")
        ├── require("DuarteRS.plugins.comment")
        └── require("DuarteRS.plugins.formatting")
```

**Key detail:** Mason is loaded **before** the LSP configuration so that all language servers are installed and available when `lspconfig` sets them up. The colorscheme is loaded first so every subsequent UI plugin inherits the correct colors.

---

## Core Configuration

### Options (`lua/DuarteRS/core/options.lua`)

All Neovim options are set through a single Lua table that is iterated with `vim.opt`. Here is every option grouped by category:

#### General

| Option | Value | Description |
|--------|-------|-------------|
| `mouse` | `"a"` | Enable mouse support in all modes (normal, insert, visual, command) |
| `clipboard` | `"unnamedplus"` | Yank/paste uses the system clipboard (`+` register) |
| `swapfile` | `false` | Disable `.swp` swap files (avoids annoying recovery prompts) |
| `backup` | `false` | Disable `~` backup files |
| `undofile` | `true` | Persistent undo history saved to disk (survives closing Neovim) |
| `hidden` | `true` | Allow switching buffers without saving the current one |
| `scs` | `true` | Smart case search (see Search section) |
| `wildmenu` | `true` | Enhanced command-line completion with a popup menu |

#### UI

| Option | Value | Description |
|--------|-------|-------------|
| `number` | `true` | Show absolute line numbers in the gutter |
| `relativenumber` | `true` | Show relative line numbers (combined with `number`, the current line shows the absolute number) |
| `cursorline` | `true` | Highlight the entire line where the cursor is |
| `termguicolors` | `true` | Enable 24-bit RGB color in the terminal (required for modern themes) |
| `signcolumn` | `"yes"` | Always show the sign column (prevents layout shift from LSP/git signs) |
| `cmdheight` | `2` | Command line takes 2 rows (more space for messages, fewer "Press ENTER" prompts) |
| `pumheight` | `10` | Popup completion menu shows at most 10 items |
| `showmode` | `true` | Show the current mode (NORMAL, INSERT, etc.) in the command line |
| `numberwidth` | `4` | Width of the line number column (4 characters) |
| `wrap` | `true` | Long lines wrap visually to the next screen line |
| `linebreak` | `true` | When wrapping, break at word boundaries (not mid-word) |

#### Tabs & Indentation

| Option | Value | Description |
|--------|-------|-------------|
| `tabstop` | `4` | A `<Tab>` character displays as 4 spaces |
| `shiftwidth` | `4` | Each indentation level is 4 spaces (used by `>>`, `<<`, auto-indent) |
| `expandtab` | `true` | Pressing `<Tab>` inserts spaces instead of a tab character |
| `autoindent` | `true` | New lines inherit the indentation of the previous line |
| `smartindent` | `true` | Automatically adds an extra indent after `{`, keywords like `if`, etc. |

#### Search

| Option | Value | Description |
|--------|-------|-------------|
| `ignorecase` | `true` | Search patterns are case-insensitive by default |
| `smartcase` | `true` | If the search pattern contains an uppercase letter, the search becomes case-sensitive |
| `incsearch` | `true` | Show matches incrementally as you type the search pattern |
| `hlsearch` | `true` | Highlight all matches of the last search pattern |

#### Scrolling

| Option | Value | Description |
|--------|-------|-------------|
| `scrolloff` | `8` | Keep at least 8 lines visible above and below the cursor when scrolling |
| `sidescrolloff` | `8` | Keep at least 8 columns visible to the left and right of the cursor |

#### Splits

| Option | Value | Description |
|--------|-------|-------------|
| `splitbelow` | `true` | Horizontal splits (`:split`) open below the current window |
| `splitright` | `true` | Vertical splits (`:vsplit`) open to the right of the current window |

#### Performance

| Option | Value | Description |
|--------|-------|-------------|
| `updatetime` | `300` | After 300ms of inactivity, write the swap file and trigger `CursorHold` (affects LSP hover, gitsigns) |
| `timeoutlen` | `500` | Wait 500ms for a mapped key sequence to complete (affects which-key popup delay) |

#### Encoding & Font

| Option | Value | Description |
|--------|-------|-------------|
| `fileencoding` | `"utf-8"` | Files are saved in UTF-8 encoding |
| `guifont` | `"monospace:h17"` | Font for GUI clients (Neovide, etc.) |
| `whichwrap` | `"bs<>[]hl"` | Allow `h`, `l`, `<BS>`, `<Space>`, arrow keys to move to the previous/next line |

---

### Plugin Manager: lazy.nvim (`lua/DuarteRS/core/plugins.lua`)

[lazy.nvim](https://github.com/folke/lazy.nvim) is bootstrapped automatically. If the `lazy.nvim` directory doesn't exist in Neovim's data directory, it clones the stable branch from GitHub. If the clone fails, an error message is shown and Neovim exits.

After bootstrapping, `require('lazy').setup({...})` declares all plugins. The plugin specifications include:

| Category | Plugins |
|----------|---------|
| **Colorschemes** | `tokyonight.nvim`, `onedark.vim`, `vim-nightfly-colors`, `catppuccin/nvim`, `kanagawa.nvim`, `vesper.nvim` |
| **Fuzzy Finder** | `telescope.nvim`, `plenary.nvim` (dependency) |
| **Statusline** | `lualine.nvim`, `nvim-web-devicons` |
| **File Explorer** | `nvim-tree.lua`, `nvim-web-devicons` |
| **Buffer Line** | `bufferline.nvim`, `vim-bbye` |
| **Keybinding Helper** | `which-key.nvim` |
| **Auto-pairs** | `AutoSave.nvim`, `autoclose.nvim`, `nvim-autopairs` |
| **LSP** | `nvim-lspconfig`, `mason.nvim`, `mason-lspconfig.nvim`, `mason-tool-installer.nvim` |
| **Completion** | `nvim-cmp`, `cmp-buffer`, `cmp-path`, `LuaSnip`, `cmp_luasnip`, `cmp-nvim-lsp`, `cmp-nvim-lua`, `friendly-snippets`, `lspkind.nvim` |
| **Treesitter** | `nvim-treesitter`, `rainbow-delimiters.nvim`, `nvim-treesitter-context`, `nvim-ts-autotag` |
| **Diagnostics** | `trouble.nvim`, `todo-comments.nvim` |
| **Buffer Tabs** | `barbar.nvim` |
| **Git** | `gitsigns.nvim` |
| **Terminal** | `toggleterm.nvim` |
| **Notifications** | `nvim-notify` (lazy=false, priority=1000 for immediate load) |
| **Dashboard** | `alpha-nvim` (loads on `VimEnter`) |
| **UI Enhancement** | `dressing.nvim` (loads on `VeryLazy`) |
| **Comments** | `Comment.nvim`, `nvim-ts-context-commentstring` |
| **Surround** | `nvim-surround` (config=true, uses defaults) |
| **Formatting** | `conform.nvim` |

---

### Keymaps (`lua/DuarteRS/core/keymaps.lua`)

This file is currently empty. All keymaps are defined **within their respective plugin configuration files** for better organization and locality. See the [Complete Keymap Reference](#complete-keymap-reference) section for every mapping.

> **Note:** The leader key is `<Space>` (Neovim default with lazy.nvim).

---

## Plugins (In-Depth)

### 1. Colorscheme - TokyoNight

**File:** `lua/DuarteRS/plugins/colorschemes.lua`
**Plugin:** [folke/tokyonight.nvim](https://github.com/folke/tokyonight.nvim)

Six colorschemes are installed, but **TokyoNight** in the `"night"` style is the active one. The theme is heavily customized with a deep navy-blue palette:

| Color Variable | Custom Value | Purpose |
|----------------|-------------|---------|
| `bg` | `#011628` | Main editor background |
| `bg_dark` | `#011423` | Darker background variant |
| `bg_float` | `#011423` | Floating window background |
| `bg_highlight` | `#143652` | Highlighted line background |
| `bg_popup` | `#011423` | Popup menu background |
| `bg_search` | `#0A64AC` | Search highlight background |
| `bg_sidebar` | `#011423` | Sidebar (NvimTree) background |
| `bg_statusline` | `#011423` | Statusline background |
| `bg_visual` | `#275378` | Visual selection background |
| `fg` | `#CBE0F0` | Main foreground text |
| `fg_dark` | `#B4D0E9` | Dimmer foreground |
| `fg_float` | `#CBE0F0` | Floating window text |
| `fg_gutter` | `#627E97` | Line number / gutter text |
| `fg_sidebar` | `#B4D0E9` | Sidebar text |
| `border` | `#547998` | Window border color |

**Transparent background** is applied after the colorscheme loads. The following highlight groups have their background set to `NONE`:
- `Normal`, `NormalNC` (active and inactive windows)
- `EndOfBuffer` (the `~` lines below the file)
- `NormalFloat` (floating windows)
- `SignColumn` (the gutter where signs appear)

This allows the terminal background to show through, giving a seamless look.

**Available but inactive schemes** (uncomment to switch):
- `onedark` - Atom's One Dark theme
- `nightfly` - Dark navy theme
- `catppuccin` - Pastel theme with multiple flavors
- `kanagawa` - Theme inspired by Katsushika Hokusai's paintings
- `vesper` - Minimalist dark theme

---

### 2. Telescope - Fuzzy Finder

**File:** `lua/DuarteRS/plugins/telescope.lua`
**Plugin:** [nvim-telescope/telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
**Dependencies:** `plenary.nvim`

Telescope is configured with:

- **Smart path display:** File paths are shortened intelligently to save space
- **ripgrep (`rg`) as the search backend** with the following flags:
  - `--hidden` - Search inside hidden files (dotfiles)
  - `--exclude .git` - Exclude the `.git` directory from results
  - `--smart-case` - Case-insensitive unless uppercase is used

**Keymaps:**

| Keymap | Action | Description |
|--------|--------|-------------|
| `<leader>ff` | `find_files` | Find files in the project (includes hidden, excludes .git) |
| `<leader>fg` | `live_grep` | Grep through all files in real time (includes hidden files) |
| `<leader>fb` | `buffers` | List and switch between open buffers |
| `<leader>fh` | `help_tags` | Search Neovim help documentation |
| `<leader>fp` | `planets` | Fun easter egg - shows planets |
| `<leader>gc` | `git_commits` | Browse Git commit history |

**Inside a Telescope picker**, these default keybindings apply:

| Key | Mode | Action |
|-----|------|--------|
| `<CR>` | Insert/Normal | Confirm selection (open file) |
| `<C-x>` | Insert | Open in horizontal split |
| `<C-v>` | Insert | Open in vertical split |
| `<C-t>` | Insert | Open in new tab |
| `<C-n>` / `<C-p>` | Insert | Next / previous item |
| `j` / `k` | Normal | Next / previous item |
| `<C-u>` / `<C-d>` | Insert | Scroll preview up / down |
| `<Esc>` | Normal | Close telescope |
| `<C-c>` | Insert | Close telescope |

---

### 3. Lualine - Statusline

**File:** `lua/DuarteRS/plugins/lualine.lua`
**Plugin:** [nvim-lualine/lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)

Lualine provides a rich, informative statusline at the bottom of the editor. The theme is set to `'auto'` (inherits from the active colorscheme).

**Statusline layout (left to right):**

```
┌─────────────────────────────────────────────────────────────────────────┐
│ A: fileformat mode │ B: branch diff diagnostics │ C: buffers filename │
│                                               X: filesize filetype │ Y: progress │ Z: selectioncount location │
└─────────────────────────────────────────────────────────────────────────┘
```

| Section | Components | Description |
|---------|-----------|-------------|
| **A** (far left) | `fileformat`, `mode` | Shows the file format (Unix/DOS/Mac) and current Vim mode |
| **B** | `branch`, `diff`, `diagnostics` | Git branch name, diff stats (+/-/~), LSP diagnostic counts |
| **C** (center) | `buffers`, `filename`, `aerial` | Open buffers, current filename, code outline |
| **X** | `filesize`, `filetype` | File size and detected filetype |
| **Y** | `progress` | Scroll position as percentage through the file |
| **Z** (far right) | `selectioncount`, `location` | Number of selected characters/lines, cursor line:column |

**Configuration details:**
- `globalstatus = true` - A single statusline shared across all windows (instead of per-window)
- **Separators:** Section separators use powerline-style rounded icons (`` / ``), component separators use thin chevrons (`` / ``)
- **Refresh rate:** Statusline refreshes every 10ms (near real-time), tabline and winbar refresh every 1000ms

---

### 4. NvimTree - File Explorer

**File:** `lua/DuarteRS/plugins/nvim-tree.lua`
**Plugin:** [nvim-tree/nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua)

A file explorer sidebar. Neovim's built-in `netrw` file explorer is **disabled** (`vim.g.loaded_netrw = 1`) to prevent conflicts.

**Configuration:**

| Setting | Value | Description |
|---------|-------|-------------|
| `view.width` | `30` | Sidebar is 30 columns wide |
| `view.side` | `"right"` | Sidebar opens on the **right** side |
| `view.relativenumber` | `true` | Shows relative line numbers inside the tree |
| `sort.sorter` | `"case_sensitive"` | Files are sorted case-sensitively (uppercase first) |
| `renderer.group_empty` | `true` | Empty directories are grouped with their child (e.g., `src/utils/` shown as one node) |
| `renderer.highlight_opened_files` | `"all"` | All opened files are highlighted in the tree |
| `renderer.indent_markers.enable` | `true` | Show indent guide lines for nested directories |
| `renderer.icons.glyphs.folder.arrow_closed` | `` | Arrow icon for collapsed folders |
| `renderer.icons.glyphs.folder.arrow_open` | `` | Arrow icon for expanded folders |
| `filters.dotfiles` | `false` | Dotfiles (hidden files) **are shown** |
| `git.enable` | `true` | Show git status icons next to files |
| `git.ignore` | `false` | Files in `.gitignore` **are shown** |
| `actions.open_file.quit_on_open` | `true` | The tree **closes automatically** when you open a file |
| `actions.open_file.window_picker.enable` | `false` | Files always open in the last focused window |
| `update_focused_file.enable` | `true` | The tree auto-highlights the currently open file |
| `update_focused_file.update_cwd` | `true` | Changes the working directory to match the current file |

**Keymaps:**

| Keymap | Action | Description |
|--------|--------|-------------|
| `<leader>ee` | `NvimTreeFocus` | Open/focus the file explorer |
| `<leader>ef` | `NvimTreeFindFileToggle` | Toggle the tree and jump to the current file |
| `<leader>ec` | `NvimTreeCollapse` | Collapse all open directories |
| `<leader>er` | `NvimTreeRefresh` | Refresh the file tree |

**Inside the NvimTree window** (default keybindings):

| Key | Action |
|-----|--------|
| `<CR>` or `o` | Open file or expand directory |
| `a` | Create a new file or directory (end with `/` for directory) |
| `d` | Delete file/directory |
| `r` | Rename file/directory |
| `x` | Cut file (for moving) |
| `c` | Copy file |
| `p` | Paste file |
| `y` | Copy filename |
| `Y` | Copy relative path |
| `gy` | Copy absolute path |
| `R` | Refresh tree |
| `H` | Toggle hidden files |
| `I` | Toggle gitignore filter |
| `q` | Close NvimTree |
| `?` | Show help |

---

### 5. Bufferline

**File:** `lua/DuarteRS/plugins/bufferline.lua`
**Plugin:** [akinsho/bufferline.nvim](https://github.com/akinsho/bufferline.nvim)

Displays open buffers as tabs at the top of the editor. Configured alongside Barbar (both are loaded).

**Configuration:**

| Setting | Value | Description |
|---------|-------|-------------|
| `numbers` | `"ordinal"` | Buffers are numbered 1, 2, 3... (not by buffer ID) |
| `indicator.style` | `"icon"` | Active buffer has a vertical bar indicator |
| `indicator.icon` | `▎` | The indicator character |
| `modified_icon` | `●` | Shown next to modified (unsaved) buffers |
| `tab_size` | `18` | Minimum tab width in characters |
| `max_name_length` | `18` | Filenames are truncated at 18 characters |
| `diagnostics` | `"nvim_lsp"` | LSP diagnostic counts appear on buffer tabs |
| `offsets` | NvimTree offset | When NvimTree is open, bufferline shifts to accommodate it, showing "File Explorer" |

**Keymaps:**

| Keymap | Action | Description |
|--------|--------|-------------|
| `<leader>bn` | `BufferLineCycleNext` | Go to the next buffer |
| `<leader>bp` | `BufferLineCyclePrev` | Go to the previous buffer |
| `<leader>bc` | `bdelete` | Close the current buffer |

---

### 6. Barbar - Buffer Tabs

**File:** `lua/DuarteRS/plugins/barbar.lua`
**Plugin:** [romgrk/barbar.nvim](https://github.com/romgrk/barbar.nvim)

Barbar is a second buffer tab plugin providing extensive buffer manipulation keybindings. It runs alongside Bufferline.

**Keymaps:**

| Keymap | Action | Description |
|--------|--------|-------------|
| `Alt + ,` | `BufferPrevious` | Go to previous buffer |
| `Alt + .` | `BufferNext` | Go to next buffer |
| `Alt + <` | `BufferMovePrevious` | Move current buffer one position left |
| `Alt + >` | `BufferMoveNext` | Move current buffer one position right |
| `<leader>1` - `<leader>9` | `BufferGoto 1-9` | Jump directly to buffer at position 1-9 |
| `<leader>0` | `BufferLast` | Jump to the last buffer |
| `Alt + p` | `BufferPin` | Pin/unpin the current buffer |
| `Alt + c` | `BufferClose` | Close the current buffer |
| `Ctrl + p` | `BufferPick` | Enter buffer-picking mode (shows letters on each tab to jump to) |
| `<Space>bb` | `BufferOrderByBufferNumber` | Sort buffers by buffer number |
| `<Space>bd` | `BufferOrderByDirectory` | Sort buffers by directory |
| `<Space>bl` | `BufferOrderByLanguage` | Sort buffers by file language |
| `<Space>bw` | `BufferOrderByWindowNumber` | Sort buffers by window number |

**Additional Barbar commands (no keybinds set):**

| Command | Description |
|---------|-------------|
| `:BufferWipeout` | Completely remove a buffer (including undo history) |
| `:BufferCloseAllButCurrent` | Close all buffers except the active one |
| `:BufferCloseAllButPinned` | Close all buffers except pinned ones |
| `:BufferCloseAllButCurrentOrPinned` | Close all except current and pinned |
| `:BufferCloseBuffersLeft` | Close all buffers to the left |
| `:BufferCloseBuffersRight` | Close all buffers to the right |

---

### 7. Which-Key - Keybinding Helper

**File:** `lua/DuarteRS/plugins/which-key.lua`
**Plugin:** [folke/which-key.nvim](https://github.com/folke/which-key.nvim)

Which-Key shows a popup window when you start pressing a key sequence (like `<leader>`), displaying all available continuations. This makes discovering keybindings effortless.

**Configuration:**

| Setting | Value | Description |
|---------|-------|-------------|
| `preset` | `"modern"` | Uses the modern UI style |
| `plugins.marks` | `true` | Shows marks when pressing `'` or `` ` `` |
| `plugins.registers` | `true` | Shows register contents when pressing `"` |
| `plugins.spelling.enabled` | `true` | Shows spelling suggestions when pressing `z=` |
| `plugins.spelling.suggestions` | `20` | Up to 20 spelling suggestions |
| `layout.align` | `"center"` | Key groups are centered in the popup |
| `show_help` | `true` | Shows help text when pressing `?` |

**Leader key groups** (what you see when pressing `<Space>`):

| Prefix | Group Name | Description |
|--------|-----------|-------------|
| `<leader>b` | **Buffers** | Buffer management commands |
| `<leader>e` | **File Explorer** | NvimTree commands |
| `<leader>f` | **Find / Telescope** | Telescope search commands |
| `<leader>g` | **Git** | Git-related commands |
| `<leader>v` | **Split / View** | Split/view management |

---

### 8. Autoclose - Auto Pair Brackets

**File:** `lua/DuarteRS/plugins/autoclose.lua`
**Plugin:** [m4xshen/autoclose.nvim](https://github.com/m4xshen/autoclose.nvim)

Automatically inserts and manages matching pairs of brackets, quotes, and other delimiters.

**Pair behavior:**

| Character | Escape | Close | Pair | Special Rules |
|-----------|--------|-------|------|---------------|
| `(` | No | Yes | `()` | Typing `(` inserts `()` with cursor between |
| `[` | No | Yes | `[]` | Same as above |
| `{` | No | Yes | `{}` | Same as above |
| `)` | Yes | No | `()` | Typing `)` moves past the closing `)` instead of inserting |
| `]` | Yes | No | `[]` | Same behavior |
| `}` | Yes | No | `{}` | Same behavior |
| `>` | Yes | No | `<>` | Escapes past `>` but doesn't auto-close (avoids conflicts with operators) |
| `"` | Yes | Yes | `""` | Auto-closes AND escapes; **disabled in gitcommit** filetypes |
| `'` | Yes | Yes | `''` | Same as `"` |
| `` ` `` | Yes | Yes | ` `` ` | Same; also **disabled in tex** filetypes |
| `$` | Yes | Yes | `$$` | **Only enabled in tex** filetypes (LaTeX math mode) |

**Options:**
- Disabled entirely in `text` filetypes
- `auto_indent = true` - Adds proper indentation when pressing Enter between pairs
- `disable_when_touch = false` - Pairs are inserted even when the cursor is touching another character

---

### 9. Mason - LSP/Tool Installer

**File:** `lua/DuarteRS/plugins/mason.lua`
**Plugin:** [williamboman/mason.nvim](https://github.com/williamboman/mason.nvim)

Mason is a portable package manager that installs and manages LSP servers, formatters, linters, and DAP servers.

**Mason UI icons:**

| Status | Icon |
|--------|------|
| Installed | `✓` |
| Pending | `➜` |
| Uninstalled | `✗` |

**mason-lspconfig** ensures these LSP servers are installed and configured:

| Server | Language(s) | Custom Config |
|--------|------------|---------------|
| `ts_ls` | TypeScript / JavaScript | Default handler |
| `html` | HTML | Default handler |
| `cssls` | CSS / SCSS / LESS | Default handler |
| `tailwindcss` | Tailwind CSS | Default handler |
| `svelte` | Svelte | Custom: notifies Svelte server when `.js`/`.ts` files change |
| `lua_ls` | Lua | Custom: adds `vim` as a global, disables third-party checking, enables call snippets |
| `graphql` | GraphQL | Custom: extended filetypes (HTML, React, CSS, Sass, SCSS, LESS, Svelte) |
| `emmet_ls` | Emmet (HTML/CSS snippets) | Default handler |
| `prismals` | Prisma ORM | Default handler |
| `pyright` | Python | Default handler |
| `eslint` | JavaScript/TypeScript linting | Default handler |

All servers receive `cmp_nvim_lsp` enhanced capabilities for autocompletion integration.

**mason-tool-installer** ensures these tools are installed:

| Tool | Purpose |
|------|---------|
| `prettier` | Formatter for JS, TS, HTML, CSS, JSON, YAML, Markdown, GraphQL |
| `stylua` | Formatter for Lua |
| `isort` | Python import sorter |
| `black` | Python code formatter |

---

### 10. LSP Configuration

**File:** `lua/DuarteRS/plugins/lsp.lua`
**Plugin:** [neovim/nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)

This file defines keymaps that activate when an LSP server attaches to a buffer (via the `LspAttach` autocmd) and configures diagnostic display.

**LSP Keymaps** (only active in buffers with an attached LSP):

| Keymap | Mode | Action | Description |
|--------|------|--------|-------------|
| `gR` | Normal | `Telescope lsp_references` | Show all references to the symbol under cursor in Telescope |
| `gD` | Normal | `vim.lsp.buf.declaration` | Jump to the declaration of the symbol |
| `gd` | Normal | `Telescope lsp_definitions` | Show definitions in Telescope |
| `gi` | Normal | `Telescope lsp_implementations` | Show implementations in Telescope |
| `gt` | Normal | `Telescope lsp_type_definitions` | Show type definitions in Telescope |
| `<leader>ca` | Normal, Visual | `vim.lsp.buf.code_action` | Show available code actions (quick fixes, refactors) |
| `<leader>rn` | Normal | `vim.lsp.buf.rename` | Rename the symbol under cursor across the project |
| `<leader>D` | Normal | `Telescope diagnostics bufnr=0` | Show all diagnostics for the current buffer in Telescope |
| `<leader>d` | Normal | `vim.diagnostic.open_float` | Show diagnostics for the current line in a floating window |
| `[d` | Normal | `vim.diagnostic.goto_prev` | Jump to the previous diagnostic |
| `]d` | Normal | `vim.diagnostic.goto_next` | Jump to the next diagnostic |
| `K` | Normal | `vim.lsp.buf.hover` | Show hover documentation for the symbol under cursor |
| `<leader>rs` | Normal | `:LspRestart` | Restart all LSP clients |

**Diagnostic display configuration:**

| Setting | Value | Description |
|---------|-------|-------------|
| `virtual_text` | `true` | Inline diagnostic messages appear at the end of the line |
| `signs` | Custom icons | Sign column icons: `` (Error), `!` (Warning), `+` (Hint), `i` (Info) |
| `update_in_insert` | `false` | Diagnostics don't update while typing in insert mode (less distracting) |
| `underline` | `true` | Problematic code is underlined |
| `severity_sort` | `true` | More severe diagnostics (errors) are shown first |

---

### 11. nvim-cmp - Autocompletion

**File:** `lua/DuarteRS/plugins/nvim-cmp.lua`
**Plugin:** [hrsh7th/nvim-cmp](https://github.com/hrsh7th/nvim-cmp)

A powerful autocompletion engine. It aggregates suggestions from multiple sources and presents them in a bordered popup.

**Snippet engine:** LuaSnip with `friendly-snippets` (a collection of VS Code-style snippets for many languages).

**Completion sources** (in priority order):

| Source | Label | Description |
|--------|-------|-------------|
| `nvim_lsp` | `[LSP]` | Suggestions from the active LSP server (functions, variables, types) |
| `luasnip` | `[Snippet]` | Snippet expansions (e.g., `log` -> `console.log()`) |
| `buffer` | `[Buffer]` | Words from the current buffer |
| `path` | `[Path]` | Filesystem path completion |

**Keymaps (in insert/command mode):**

| Keymap | Action | Description |
|--------|--------|-------------|
| `Ctrl + Up` | Select previous item | Move up in the completion menu |
| `Ctrl + Down` | Select next item | Move down in the completion menu |
| `Ctrl + b` | Scroll docs up | Scroll the documentation window up |
| `Ctrl + f` | Scroll docs down | Scroll the documentation window down |
| `Ctrl + Space` | Trigger completion | Manually open the completion menu |
| `Ctrl + e` | Abort/close | Close the completion menu |
| `Ctrl + y` | Disabled | The default `<C-y>` mapping is explicitly disabled |
| `Enter` | Confirm | Accept the currently selected (or first) item |

**Formatting:** Each completion item shows:
1. A **kind icon** (e.g., `󰊕` for Function, `󰀫` for Variable, `` for Class)
2. The **abbreviation** (the actual text to insert)
3. A **source label** (`[LSP]`, `[Snippet]`, `[Buffer]`, `[Path]`)

**Kind icons reference:**

| Kind | Icon | Kind | Icon |
|------|------|------|------|
| Text | `󰉿` | Method | `󰆧` |
| Function | `󰊕` | Constructor | `` |
| Field | ` ` | Variable | `󰀫` |
| Class | `󰠱` | Interface | `` |
| Module | `` | Property | `󰜢` |
| Unit | `󰑭` | Value | `󰎠` |
| Enum | `` | Keyword | `󰌋` |
| Snippet | `` | Color | `󰏘` |
| File | `󰈙` | Reference | `` |
| Folder | `󰉋` | EnumMember | `` |
| Constant | `󰏿` | Struct | `` |
| Event | `` | Operator | `󰆕` |
| TypeParameter | ` ` | Misc | ` ` |

**Window styling:**
- Completion popup: Bordered window
- Documentation popup: Custom Unicode box-drawing border (`╭─╮│╯─╰│`)

---

### 12. Treesitter - Syntax Highlighting

**File:** `lua/DuarteRS/plugins/treesitter.lua`
**Plugin:** [nvim-treesitter/nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)

Treesitter provides **AST-based syntax highlighting** (much more accurate than regex-based highlighting), smart indentation, and incremental selection.

**Configuration:**

| Setting | Value | Description |
|---------|-------|-------------|
| `sync_install` | `false` | Parsers install asynchronously (non-blocking) |
| `auto_install` | `true` | Missing parsers are installed automatically when you open a file |
| `highlight.enable` | `true` | Treesitter-based syntax highlighting is active |
| `highlight.additional_vim_regex_highlighting` | `false` | Disables legacy regex highlighting (better performance) |
| `indent.enable` | `true` | Treesitter-based smart indentation |
| `autotag.enable` | `true` | Automatic HTML/JSX tag closing and renaming (via `nvim-ts-autotag`) |

**Highlight disable conditions:**
- Files larger than **100 KB** fall back to regex highlighting (performance safeguard)
- **LaTeX** (`latex`) files are excluded from Treesitter highlighting

**Ensured parsers** (installed automatically):

`json`, `javascript`, `typescript`, `tsx`, `yaml`, `html`, `css`, `prisma`, `svelte`, `graphql`, `bash`, `dockerfile`, `gitignore`, `java`, `c`, `cpp`, `lua`, `vim`, `vimdoc`, `query`, `markdown`, `markdown_inline`

**Incremental selection keymaps:**

| Keymap | Action | Description |
|--------|--------|-------------|
| `Ctrl + Space` | Init / expand selection | Start selecting the current node, then expand to parent |
| `Backspace` | Shrink selection | Shrink the selection to the child node |

---

### 13. Treesitter Context

**File:** `lua/DuarteRS/plugins/treesitter-context.lua`
**Plugin:** [nvim-treesitter/nvim-treesitter-context](https://github.com/nvim-treesitter/nvim-treesitter-context)

Shows the function/class/block header at the top of the window when you scroll past it. For example, if you're inside a long function, the function signature stays pinned at the top.

| Setting | Value | Description |
|---------|-------|-------------|
| `enable` | `true` | Plugin is active |
| `max_lines` | `0` | No limit on how many context lines to show |
| `min_window_height` | `0` | Active regardless of window size |
| `line_numbers` | `true` | Context lines show their original line numbers |
| `multiline_threshold` | `1` | Only 1 line per context level (keeps it compact) |
| `trim_scope` | `"outer"` | If max_lines is exceeded, discard outer (parent) contexts first |
| `mode` | `"cursor"` | Context is calculated based on cursor position |
| `zindex` | `20` | Z-index ensures context renders above other floating elements |

---

### 14. Rainbow Delimiters

**File:** `lua/DuarteRS/plugins/rainbow-delimiters.lua`
**Plugin:** [HiPhish/rainbow-delimiters.nvim](https://github.com/HiPhish/rainbow-delimiters.nvim)

Colors matching brackets/parentheses/braces with different colors based on nesting depth. Uses 7 colors cycling through:

1. Red
2. Yellow
3. Blue
4. Orange
5. Green
6. Violet
7. Cyan

**Strategy:**
- Default: `global` strategy (highlights all delimiters in the file)
- Vim filetypes: `local` strategy (only highlights near the cursor)

**Query:**
- Default: `rainbow-delimiters` (standard parentheses/brackets)
- Lua and Bash: `rainbow-blocks` (highlights block structures like `do...end`, `if...fi`)

**Priority:** Lua has a higher priority (210) than the default (110) to ensure proper rendering.

---

### 15. Trouble - Diagnostics Panel

**File:** `lua/DuarteRS/plugins/trouble.lua`
**Plugin:** [folke/trouble.nvim](https://github.com/folke/trouble.nvim)

Trouble provides a structured, interactive list view for diagnostics, quickfix items, location lists, and TODOs.

**Configuration:**
- `position = "bottom"` - The panel opens at the bottom of the screen
- `diagnostics.auto_open = true` - Trouble opens automatically when there are diagnostics
- `diagnostics.auto_close = false` - Trouble stays open even when diagnostics are resolved
- `diagnostics.auto_preview = false` - Selecting a diagnostic doesn't auto-preview it

**Keymaps:**

| Keymap | Action | Description |
|--------|--------|-------------|
| `<leader>xx` | `Trouble diagnostics toggle` | Toggle the diagnostics list |
| `<leader>xw` | `Trouble diagnostics toggle_preview` | Toggle diagnostics with preview |
| `<leader>xd` | `Trouble diagnostics toggle filter.buf=0` | Toggle diagnostics for current buffer only |
| `<leader>xq` | `Trouble qflist toggle` | Toggle quickfix list in Trouble |
| `<leader>xl` | `Trouble loclist toggle` | Toggle location list in Trouble |

---

### 16. Gitsigns - Git Integration

**File:** `lua/DuarteRS/plugins/gitsigns.lua`
**Plugin:** [lewis6991/gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)

Shows Git diff signs in the sign column and provides a rich set of Git operations.

**Sign characters:**

| Change Type | Sign | Description |
|------------|------|-------------|
| Added | `┃` | New lines added |
| Changed | `┃` | Modified lines |
| Deleted | `_` | Lines deleted below this point |
| Top-delete | `‾` | Lines deleted above this point |
| Change-delete | `~` | Lines changed and some deleted |
| Untracked | `┆` | Lines in untracked files |

Staged changes use the same signs.

**Configuration highlights:**
- `signcolumn = true` - Signs are shown in the gutter
- `current_line_blame = false` - Inline git blame is off by default (toggle with `<leader>tb`)
- `current_line_blame_formatter` - Format: `author, time_ago - commit message`
- `max_file_length = 40000` - Gitsigns is disabled for files over 40,000 lines
- `watch_gitdir.follow_files = true` - Follows file renames
- `preview_config.style = 'minimal'` - Minimal floating window for previews

**Keymaps (active in buffers with git):**

#### Navigation

| Keymap | Action | Description |
|--------|--------|-------------|
| `]c` | Next hunk | Jump to the next changed hunk (or next diff change in diff mode) |
| `[c` | Previous hunk | Jump to the previous changed hunk |

#### Actions

| Keymap | Mode | Action | Description |
|--------|------|--------|-------------|
| `<leader>hs` | Normal | `stage_hunk` | Stage the hunk under the cursor |
| `<leader>hr` | Normal | `reset_hunk` | Reset the hunk under the cursor (discard changes) |
| `<leader>hs` | Visual | `stage_hunk` (selection) | Stage the selected lines |
| `<leader>hr` | Visual | `reset_hunk` (selection) | Reset the selected lines |
| `<leader>hS` | Normal | `stage_buffer` | Stage the entire buffer (like `git add %`) |
| `<leader>hR` | Normal | `reset_buffer` | Reset the entire buffer |
| `<leader>hp` | Normal | `preview_hunk` | Preview the hunk in a floating window |
| `<leader>hi` | Normal | `preview_hunk_inline` | Preview the hunk inline (below the line) |
| `<leader>hb` | Normal | `blame_line` (full) | Show full git blame for the current line |
| `<leader>hd` | Normal | `diffthis` | Open a diff split comparing the buffer with the index |
| `<leader>hD` | Normal | `diffthis('~')` | Open a diff split comparing with the previous commit |
| `<leader>hQ` | Normal | `setqflist('all')` | Send all hunks in the repo to the quickfix list |
| `<leader>hq` | Normal | `setqflist` | Send hunks in the current buffer to the quickfix list |

#### Toggles

| Keymap | Action | Description |
|--------|--------|-------------|
| `<leader>tb` | `toggle_current_line_blame` | Toggle inline git blame on/off |
| `<leader>tw` | `toggle_word_diff` | Toggle word-level diff highlighting |

#### Text Object

| Keymap | Mode | Action | Description |
|--------|------|--------|-------------|
| `ih` | Operator-pending, Visual | `select_hunk` | Select the current hunk as a text object (e.g., `vih` to visually select a hunk, `dih` to delete it) |

---

### 17. ToggleTerm - Integrated Terminal

**File:** `lua/DuarteRS/plugins/toggleterm.lua`
**Plugin:** [akinsho/toggleterm.nvim](https://github.com/akinsho/toggleterm.nvim)

Provides a toggleable floating terminal window inside Neovim.

**Configuration:**

| Setting | Value | Description |
|---------|-------|-------------|
| `size` | `20` | Terminal height (for horizontal) or width (for vertical) |
| `open_mapping` | `Ctrl + \` | Global keymap to toggle the terminal |
| `direction` | `"float"` | Terminal opens as a centered floating window |
| `float_opts.border` | `"curved"` | The floating window has curved/rounded borders |
| `float_opts.winblend` | `0` | Fully opaque (no transparency) |
| `hide_numbers` | `true` | Line numbers are hidden inside the terminal |
| `shade_terminals` | `true` | Terminal background is slightly shaded |
| `shading_factor` | `2` | Shading intensity |
| `start_in_insert` | `true` | Terminal starts in insert mode (ready to type) |
| `insert_mappings` | `true` | The toggle mapping works from insert mode too |
| `persist_size` | `true` | Terminal remembers its size across toggles |
| `close_on_exit` | `true` | Terminal window closes when the shell process exits |
| `shell` | `vim.o.shell` | Uses the system's default shell |

**Keymaps:**

| Keymap | Mode | Action | Description |
|--------|------|--------|-------------|
| `Ctrl + \` | Any | `ToggleTerm` | Open/close the floating terminal |
| `<leader>t` | Normal | `ToggleTerm` | Alternative toggle for the terminal |
| `<leader>vl` | Normal | `ToggleTermCurrentLine` | Send the current line to the terminal |
| `<leader>vv` | Normal | `ToggleTermVisualLines` | Send visual lines to the terminal |
| `<leader>vs` | Normal | `ToggleTermVisualSelection` | Send visual selection to the terminal |
| `Esc` | Terminal | Exit to normal mode | Switch from terminal insert mode to normal mode |

---

### 18. Alpha - Dashboard

**File:** `lua/DuarteRS/plugins/alpha.lua`
**Plugin:** [goolord/alpha-nvim](https://github.com/goolord/alpha-nvim)

Shows a startup dashboard when Neovim opens without any file arguments. Uses the built-in `dashboard` theme.

**ASCII art header:**

```
  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
```

**Dashboard buttons:**

| Shortcut | Icon | Label | Action |
|----------|------|-------|--------|
| `e` | `` | New File | Create a new empty buffer |
| `SPC ee` | `` | Toggle file explorer | Open NvimTree |
| `SPC ff` | `` | Find File | Open Telescope file finder |
| `SPC fs` | `` | Find Word | Open Telescope live grep |
| `SPC wr` | `` | Restore Session | Restore the previous session for the current directory |
| `q` | `` | Quit NVIM | Exit Neovim |

Folding is disabled on the alpha buffer via an autocmd.

---

### 19. nvim-notify - Notifications

**File:** `lua/DuarteRS/plugins/notify.lua`
**Plugin:** [rcarriga/nvim-notify](https://github.com/rcarriga/nvim-notify)

Replaces Neovim's default `vim.notify()` with a beautiful animated notification system.

**Configuration:**

| Setting | Value | Description |
|---------|-------|-------------|
| `stages` | `"fade_in_slide_out"` | Notifications fade in and slide out |
| `render` | `"minimal"` | Compact notification style |
| `timeout` | `4000` | Notifications disappear after 4 seconds |
| `background_colour` | `"FloatShadow"` | Background inherits from the FloatShadow highlight group |
| `minimum_width` | `50` | Notifications are at least 50 characters wide |
| `top_down` | `false` | Notifications stack from the bottom up |
| `level` | `3` | Minimum level is WARN (filters out DEBUG and INFO noise) |

**Notification icons:**

| Level | Icon |
|-------|------|
| ERROR | `` |
| WARN | `` |
| INFO | `` |
| DEBUG | `` |
| TRACE | `✎` |

The plugin is set to `lazy = false` with `priority = 1000` to ensure it loads immediately before other plugins, so all notifications from startup are captured.

---

### 20. Comment.nvim - Commenting

**File:** `lua/DuarteRS/plugins/comment.lua`
**Plugin:** [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim)

Smart commenting with treesitter integration. The `nvim-ts-context-commentstring` integration ensures that in mixed-language files (like JSX/TSX, Vue, Svelte), the correct comment style is used for each section.

For example, in a `.tsx` file:
- JavaScript code: `// comment`
- JSX markup: `{/* comment */}`
- CSS in styled-components: `/* comment */`

**Default keymaps (provided by Comment.nvim):**

| Keymap | Mode | Action |
|--------|------|--------|
| `gcc` | Normal | Toggle line comment for the current line |
| `gbc` | Normal | Toggle block comment for the current line |
| `gc` + motion | Normal | Toggle line comment over a motion (e.g., `gcip` = comment paragraph) |
| `gb` + motion | Normal | Toggle block comment over a motion |
| `gc` | Visual | Toggle line comment for the selection |
| `gb` | Visual | Toggle block comment for the selection |
| `gcO` | Normal | Add comment on the line above |
| `gco` | Normal | Add comment on the line below |
| `gcA` | Normal | Add comment at the end of the current line |

---

### 21. Conform - Code Formatting

**File:** `lua/DuarteRS/plugins/formatting.lua`
**Plugin:** [stevearc/conform.nvim](https://github.com/stevearc/conform.nvim)

Provides automatic code formatting on save and manual formatting via a keymap.

**Formatters by filetype:**

| Filetype | Formatter(s) |
|----------|-------------|
| JavaScript | Prettier |
| TypeScript | Prettier |
| JavaScript React (JSX) | Prettier |
| TypeScript React (TSX) | Prettier |
| Svelte | Prettier |
| CSS | Prettier |
| HTML | Prettier |
| JSON | Prettier |
| YAML | Prettier |
| Markdown | Prettier |
| GraphQL | Prettier |
| Liquid | Prettier |
| Lua | StyLua |
| Python | isort (import sorting) + black (code formatting), run sequentially |

**Format on save:**
- `lsp_fallback = true` - If no formatter is configured, use the LSP's formatter
- `async = false` - Formatting is synchronous (blocks until done, ensures file is saved formatted)
- `timeout_ms = 3000` - 3-second timeout to prevent hanging

**StyLua configuration** (`.stylua.toml`):
- Indent type: Spaces
- Indent width: 2

**Keymaps:**

| Keymap | Mode | Action | Description |
|--------|------|--------|-------------|
| `<leader>mp` | Normal, Visual | Format | Format the entire file (normal) or selected range (visual) |

---

### 22. nvim-surround

**Plugin:** [kylechui/nvim-surround](https://github.com/kylechui/nvim-surround)

Loaded with `config = true` (default configuration). Provides keybindings to add, change, and delete surrounding pairs.

**Default keymaps:**

| Keymap | Mode | Action | Example |
|--------|------|--------|---------|
| `ys` + motion + char | Normal | Add surrounding | `ysiw"` surrounds a word with `"` |
| `yss` + char | Normal | Surround entire line | `yss)` wraps the line in `()` |
| `ds` + char | Normal | Delete surrounding | `ds"` removes surrounding `"` |
| `cs` + old + new | Normal | Change surrounding | `cs"'` changes `"` to `'` |
| `S` + char | Visual | Surround selection | Select text, press `S"` to wrap in `"` |

---

### 23. Dressing.nvim - Improved UI

**Plugin:** [stevearc/dressing.nvim](https://github.com/stevearc/dressing.nvim)

Loaded on `VeryLazy` event. Replaces the default `vim.ui.select()` and `vim.ui.input()` with much better-looking floating windows. This improves the UI for:
- Code action selection (`<leader>ca`)
- LSP rename input (`<leader>rn`)
- Any plugin that uses `vim.ui.select` or `vim.ui.input`

No custom configuration; uses sensible defaults.

---

## Complete Keymap Reference

> **Leader key:** `<Space>`

### General / Neovim Defaults

These are Neovim's built-in keybindings that are always available:

| Keymap | Mode | Action |
|--------|------|--------|
| `i` | Normal | Enter Insert mode |
| `v` | Normal | Enter Visual mode |
| `V` | Normal | Enter Visual Line mode |
| `Ctrl + v` | Normal | Enter Visual Block mode |
| `Esc` | Insert | Return to Normal mode |
| `u` | Normal | Undo |
| `Ctrl + r` | Normal | Redo |
| `.` | Normal | Repeat last change |
| `:w` | Command | Save file |
| `:q` | Command | Quit |
| `:wq` or `ZZ` | Command/Normal | Save and quit |
| `:q!` or `ZQ` | Command/Normal | Quit without saving |
| `/pattern` | Normal | Search forward |
| `?pattern` | Normal | Search backward |
| `n` / `N` | Normal | Next / previous search match |
| `*` / `#` | Normal | Search word under cursor forward / backward |
| `gg` | Normal | Go to first line |
| `G` | Normal | Go to last line |
| `{number}G` | Normal | Go to line number |
| `0` / `$` | Normal | Go to start / end of line |
| `^` | Normal | Go to first non-blank character |
| `w` / `b` | Normal | Next / previous word |
| `e` | Normal | End of current word |
| `%` | Normal | Jump to matching bracket |
| `dd` | Normal | Delete line |
| `yy` | Normal | Yank (copy) line |
| `p` / `P` | Normal | Paste after / before cursor |
| `>>` / `<<` | Normal | Indent / unindent line |
| `Ctrl + w + h/j/k/l` | Normal | Navigate between splits |
| `Ctrl + w + v` | Normal | Create vertical split |
| `Ctrl + w + s` | Normal | Create horizontal split |
| `Ctrl + w + q` | Normal | Close current split |
| `Ctrl + u` / `Ctrl + d` | Normal | Scroll half page up / down |
| `Ctrl + f` / `Ctrl + b` | Normal | Scroll full page down / up |
| `zz` | Normal | Center current line on screen |

### File Explorer (NvimTree)

| Keymap | Description |
|--------|-------------|
| `<leader>ee` | Open/focus file explorer |
| `<leader>ef` | Toggle file explorer on current file |
| `<leader>ec` | Collapse all directories |
| `<leader>er` | Refresh file explorer |

### Telescope (Fuzzy Finding)

| Keymap | Description |
|--------|-------------|
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep (search text in all files) |
| `<leader>fb` | Find open buffers |
| `<leader>fh` | Search help tags |
| `<leader>fp` | Find planets (easter egg) |
| `<leader>gc` | Browse git commits |

### Buffers (Barbar)

| Keymap | Description |
|--------|-------------|
| `Alt + ,` | Previous buffer |
| `Alt + .` | Next buffer |
| `Alt + <` | Move buffer left |
| `Alt + >` | Move buffer right |
| `<leader>1`-`9` | Go to buffer 1-9 |
| `<leader>0` | Go to last buffer |
| `Alt + p` | Pin/unpin buffer |
| `Alt + c` | Close buffer |
| `Ctrl + p` | Pick buffer (magic mode) |
| `<Space>bb` | Sort by buffer number |
| `<Space>bd` | Sort by directory |
| `<Space>bl` | Sort by language |
| `<Space>bw` | Sort by window number |

### Buffers (Bufferline)

| Keymap | Description |
|--------|-------------|
| `<leader>bn` | Next buffer |
| `<leader>bp` | Previous buffer |
| `<leader>bc` | Close current buffer |

### LSP

| Keymap | Description |
|--------|-------------|
| `gR` | Show references (Telescope) |
| `gD` | Go to declaration |
| `gd` | Show definitions (Telescope) |
| `gi` | Show implementations (Telescope) |
| `gt` | Show type definitions (Telescope) |
| `K` | Hover documentation |
| `<leader>ca` | Code actions |
| `<leader>rn` | Rename symbol |
| `<leader>D` | Buffer diagnostics (Telescope) |
| `<leader>d` | Line diagnostics (float) |
| `[d` / `]d` | Previous / next diagnostic |
| `<leader>rs` | Restart LSP |

### Autocompletion (nvim-cmp)

| Keymap | Description |
|--------|-------------|
| `Ctrl + Up` | Previous suggestion |
| `Ctrl + Down` | Next suggestion |
| `Ctrl + Space` | Trigger completion |
| `Ctrl + b` / `Ctrl + f` | Scroll docs up / down |
| `Ctrl + e` | Close completion |
| `Enter` | Confirm selection |

### Treesitter

| Keymap | Description |
|--------|-------------|
| `Ctrl + Space` | Init/expand incremental selection |
| `Backspace` | Shrink incremental selection |

### Git (Gitsigns)

| Keymap | Description |
|--------|-------------|
| `]c` / `[c` | Next / previous hunk |
| `<leader>hs` | Stage hunk |
| `<leader>hr` | Reset hunk |
| `<leader>hS` | Stage entire buffer |
| `<leader>hR` | Reset entire buffer |
| `<leader>hp` | Preview hunk |
| `<leader>hi` | Preview hunk inline |
| `<leader>hb` | Blame line (full) |
| `<leader>hd` | Diff against index |
| `<leader>hD` | Diff against previous commit |
| `<leader>hq` | Hunks to quickfix (buffer) |
| `<leader>hQ` | Hunks to quickfix (all) |
| `<leader>tb` | Toggle line blame |
| `<leader>tw` | Toggle word diff |
| `ih` | Select hunk (text object) |

### Diagnostics (Trouble)

| Keymap | Description |
|--------|-------------|
| `<leader>xx` | Toggle diagnostics list |
| `<leader>xw` | Toggle diagnostics preview |
| `<leader>xd` | Buffer diagnostics only |
| `<leader>xq` | Toggle quickfix in Trouble |
| `<leader>xl` | Toggle location list in Trouble |

### Terminal (ToggleTerm)

| Keymap | Description |
|--------|-------------|
| `Ctrl + \` | Toggle floating terminal |
| `<leader>t` | Toggle terminal |
| `<leader>vl` | Send current line to terminal |
| `<leader>vv` | Send visual lines to terminal |
| `<leader>vs` | Send visual selection to terminal |
| `Esc` (in terminal) | Exit terminal insert mode |

### Formatting (Conform)

| Keymap | Description |
|--------|-------------|
| `<leader>mp` | Format file or visual selection |

### Commenting (Comment.nvim)

| Keymap | Mode | Description |
|--------|------|-------------|
| `gcc` | Normal | Toggle line comment |
| `gbc` | Normal | Toggle block comment |
| `gc` + motion | Normal | Comment over motion |
| `gb` + motion | Normal | Block comment over motion |
| `gc` | Visual | Toggle line comment on selection |
| `gb` | Visual | Toggle block comment on selection |

### Surround (nvim-surround)

| Keymap | Mode | Description |
|--------|------|-------------|
| `ys` + motion + char | Normal | Add surrounding |
| `yss` + char | Normal | Surround entire line |
| `ds` + char | Normal | Delete surrounding |
| `cs` + old + new | Normal | Change surrounding |
| `S` + char | Visual | Surround selection |

---

## Neovim Default Keybindings Reference

For completeness, here is a reference of essential Neovim default keybindings organized by category.

### Motion

| Keymap | Description |
|--------|-------------|
| `h` `j` `k` `l` | Left, Down, Up, Right |
| `w` / `W` | Next word / WORD |
| `b` / `B` | Previous word / WORD |
| `e` / `E` | End of word / WORD |
| `0` | Start of line |
| `^` | First non-blank character |
| `$` | End of line |
| `gg` | First line of file |
| `G` | Last line of file |
| `{` / `}` | Previous / next paragraph |
| `(` / `)` | Previous / next sentence |
| `%` | Matching bracket |
| `f{char}` | Jump to next {char} on the line |
| `F{char}` | Jump to previous {char} on the line |
| `t{char}` | Jump to before next {char} |
| `T{char}` | Jump to after previous {char} |
| `;` / `,` | Repeat / reverse last f/F/t/T |
| `Ctrl+o` | Jump to older cursor position |
| `Ctrl+i` | Jump to newer cursor position |

### Editing

| Keymap | Description |
|--------|-------------|
| `i` / `a` | Insert before / after cursor |
| `I` / `A` | Insert at start / end of line |
| `o` / `O` | Open line below / above |
| `r{char}` | Replace single character |
| `R` | Enter Replace mode |
| `x` | Delete character under cursor |
| `d{motion}` | Delete over motion |
| `dd` | Delete entire line |
| `D` | Delete to end of line |
| `c{motion}` | Change over motion (delete + insert) |
| `cc` | Change entire line |
| `C` | Change to end of line |
| `y{motion}` | Yank (copy) over motion |
| `yy` | Yank entire line |
| `p` / `P` | Paste after / before |
| `J` | Join current and next line |
| `~` | Toggle case of character |
| `gu{motion}` | Lowercase over motion |
| `gU{motion}` | Uppercase over motion |
| `>>` / `<<` | Indent / unindent line |
| `=` | Auto-indent (with motion) |

### Marks & Registers

| Keymap | Description |
|--------|-------------|
| `m{a-z}` | Set mark (local to buffer) |
| `m{A-Z}` | Set mark (global across files) |
| `` `{mark} `` | Jump to mark (exact position) |
| `'{mark}` | Jump to mark (line) |
| `"{register}` | Use specific register for next yank/paste |
| `""` | Default register |
| `"0` | Yank register (last yanked text) |
| `"+` | System clipboard register |
| `":` | Last command register |

### Visual Mode

| Keymap | Description |
|--------|-------------|
| `v` | Character-wise visual |
| `V` | Line-wise visual |
| `Ctrl+v` | Block-wise visual |
| `gv` | Re-select last visual selection |
| `o` | Move to other end of selection |

### Window Management

| Keymap | Description |
|--------|-------------|
| `Ctrl+w s` | Split horizontally |
| `Ctrl+w v` | Split vertically |
| `Ctrl+w h/j/k/l` | Move to split |
| `Ctrl+w H/J/K/L` | Move split to edge |
| `Ctrl+w =` | Equalize split sizes |
| `Ctrl+w +/-` | Increase/decrease height |
| `Ctrl+w >/<` | Increase/decrease width |
| `Ctrl+w q` | Close window |
| `Ctrl+w o` | Close all other windows |
| `Ctrl+w T` | Move window to new tab |

### Tabs

| Keymap | Description |
|--------|-------------|
| `:tabnew` | Open new tab |
| `gt` / `gT` | Next / previous tab |
| `{n}gt` | Go to tab n |
| `:tabclose` | Close current tab |

### Macros

| Keymap | Description |
|--------|-------------|
| `q{register}` | Start recording macro |
| `q` | Stop recording |
| `@{register}` | Play macro |
| `@@` | Repeat last macro |

---

## LSP Servers & Formatters

### Installed Language Servers

| Server | Language | Key Features |
|--------|----------|-------------|
| **ts_ls** | TypeScript / JavaScript | Go to definition, references, rename, diagnostics, auto-imports |
| **html** | HTML | Tag completion, formatting, embedded language support |
| **cssls** | CSS / SCSS / LESS | Property completion, color preview, diagnostics |
| **tailwindcss** | Tailwind CSS | Class name completion, color preview, hover docs |
| **svelte** | Svelte | Full Svelte support with JS/TS change notifications |
| **lua_ls** | Lua | Neovim API completion (`vim` global recognized), diagnostics |
| **graphql** | GraphQL | Schema-aware completion, validation |
| **emmet_ls** | HTML/CSS | Emmet abbreviation expansion (e.g., `div.container>ul>li*3`) |
| **prismals** | Prisma | Schema completion, validation, formatting |
| **pyright** | Python | Type checking, auto-imports, diagnostics |
| **eslint** | JS/TS | Linting rules, auto-fix on save |

### Installed Formatters

| Formatter | Languages | Description |
|-----------|----------|-------------|
| **Prettier** | JS, TS, JSX, TSX, Svelte, CSS, HTML, JSON, YAML, Markdown, GraphQL, Liquid | Opinionated code formatter |
| **StyLua** | Lua | Lua code formatter (2-space indent configured) |
| **isort** | Python | Sorts and organizes Python imports |
| **black** | Python | Opinionated Python code formatter |

---

> **Note:** This configuration uses both Barbar and Bufferline for buffer management. Both provide tab-like buffer displays with their own keymaps. If you want to simplify, you can disable one by removing its `require()` line from `lua/DuarteRS/core/init.lua` and its entry from `lua/DuarteRS/core/plugins.lua`.
