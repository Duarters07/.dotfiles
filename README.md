# dotfiles

Personal development environment configuration for Linux — minimal, fast, and keyboard-driven.

---

## Stack

| Tool | Role |
|------|------|
| **Neovim** | Primary editor — LSP, Treesitter, fuzzy finding, git integration |
| **Tmux** | Terminal multiplexer — persistent sessions, vim-style navigation |
| **Zsh** | Shell — Oh My Zsh + Powerlevel10k, smart history, modern CLI tools |
| **WezTerm** | Terminal emulator — custom colorscheme, transparency, maximized on startup |

---

## Installation

```bash
git clone https://github.com/DuarteRS/.dotfiles ~/.dotfiles
```

Then symlink configs to their expected locations:

```bash
# Neovim
ln -s ~/.dotfiles/.config/nvim ~/.config/nvim

# Tmux
ln -s ~/.dotfiles/tmux/.tmux.conf ~/.tmux.conf

# Zsh
ln -s ~/.dotfiles/.zsh/.zshrc ~/.zshrc

# WezTerm
ln -s ~/.dotfiles/wezterm/.wezterm.lua ~/.wezterm.lua

# Powerlevel10k
ln -s ~/.dotfiles/.p10k.zsh ~/.p10k.zsh

# Neofetch
ln -s ~/.dotfiles/.config/neofetch ~/.config/neifetch
```

> **Dependencies:** `neovim`, `tmux`, `zsh`, `wezterm`, `oh-my-zsh`, `lsd`, `zoxide`, `atuin`, `neofetch`
