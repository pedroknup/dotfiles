# Dotfiles

Personal macOS development environment configuration files managed with symlinks. This repository contains a comprehensive Neovim setup, terminal configurations, and productivity tools for software development.

## What's Included

### 🚀 Neovim Configuration
- **Modern Lua-based setup** with Lazy.nvim plugin manager
- **30+ carefully selected plugins** including:
  - LSP support (Mason, lspconfig) for multiple languages
  - Advanced completion (nvim-cmp) with snippets
  - File navigation (Telescope, Snacks picker)
  - Git integration (Gitsigns, Lazygit)
  - Syntax highlighting (Treesitter)
  - Code formatting & linting (Conform, nvim-lint)
  - AI assistance (GitHub Copilot)
  - Modern UI (Noice, nvim-notify, Lualine)
- **Custom keymaps** optimized for productivity
- **Smart folding** with nvim-ufo
- **Terminal integration** with Snacks terminal

### 🖥️ Terminal Setup
- **Zsh configuration** with Oh My Zsh framework
- **Rich aliases** for development workflows (git, navigation, project shortcuts)
- **Enhanced shell features**:
  - Autosuggestions and syntax highlighting
  - Zoxide for smart directory jumping
  - NVM for Node.js version management
  - Vi mode for command line editing
- **Alacritty terminal** configuration with custom theme
- **Tmux configuration** with vim-style navigation and Catppuccin theme

### ⚙️ Application Configs
- **Git configuration** with global ignore patterns
- **Multiple terminal themes** (Alacritty themes collection)
- **iTerm2 settings** backup
- **Development tool configurations** (VS Code, skhd window manager)

## Directory Structure

```
~/dev/personal/dotfiles/
├── .config/
│   ├── nvim/                    # Neovim configuration
│   │   ├── init.lua            # Main entry point
│   │   └── lua/pedro/
│   │       ├── core/           # Core options & keymaps
│   │       ├── plugins/        # Plugin configurations
│   │       └── lazy.lua        # Plugin manager setup
│   ├── alacritty/              # Terminal emulator config
│   ├── tmux/                   # Tmux session manager
│   ├── git/                    # Git global settings
│   ├── iterm2/                 # iTerm2 backup
│   └── [other apps]/
├── .zshrc                      # Zsh shell configuration
├── .tmux.conf                  # Tmux configuration
├── .oh-my-zsh/                 # Zsh framework
├── install.sh                  # Setup script
├── uninstall.sh               # Cleanup script
└── README.md                   # This documentation
```

## Installation

Run the install script to create symlinks from your home directory to this repository:

```bash
cd ~/dev/personal/dotfiles
./install.sh
```

This will:
- Create backups of existing files (if any)
- Create symlinks from `~/.config`, `~/.zshrc`, etc. to the files in this repository
- Any changes you make to the config files will be tracked in this repository

## Uninstallation

To remove the symlinks:

```bash
cd ~/dev/personal/dotfiles
./uninstall.sh
```

This will remove the symlinks but leave any backup files intact.

## How It Works

The system uses symlinks to connect your home directory files to the repository:

```
~/.config     -> ~/dev/personal/dotfiles/.config
~/.zshrc      -> ~/dev/personal/dotfiles/.zshrc
```

When you edit files in your home directory (e.g., `~/.config/nvim/init.lua`), you're actually editing the files in this repository. This means:

- All changes are automatically tracked by git
- You can commit and push your dotfile changes
- You can sync across multiple machines
- You have version history of all your configs

## Adding New Files

To track a new configuration file:

1. Copy the file/directory to this repository
2. Add it to the `FILES_TO_LINK` array in `install.sh` and `uninstall.sh`
3. Run `./install.sh` to create the symlink

## Backup System

The install script automatically creates timestamped backups in `~/dotfiles-backup-YYYYMMDD_HHMMSS/` before creating symlinks.

## Key Features

### Neovim Highlights
- **Space as leader key** for intuitive shortcuts
- **Telescope** for fuzzy finding files, buffers, and live grep
- **LSP integration** with auto-completion and diagnostics
- **Treesitter** for advanced syntax highlighting and text objects
- **GitHub Copilot** for AI-powered code suggestions
- **Lazy loading** for fast startup times
- **Custom status line** with git integration and diagnostics

### Zsh Productivity
- **Smart aliases** for common git operations (`gaa`, `gcm`)
- **Project shortcuts** for quick navigation between repositories
- **Development environment** aliases (work and personal projects)
- **NVM integration** for Node.js version management
- **Zoxide integration** for intelligent directory jumping with `o` command

### Tmux Workflow
- **Vim-style navigation** between panes (hjkl)
- **Prefix key**: `Ctrl+Space` (more ergonomic than Ctrl+b)
- **Smart pane splitting** with `|` and `_`
- **Mouse support** enabled for modern terminal usage
- **Catppuccin theme** for consistent visual design

## Git Workflow

```bash
# Make changes to your configs (they're automatically in the repo)
cd ~/dev/personal/dotfiles

# See what changed
git status
git diff

# Commit changes
git add .
git commit -m "Update neovim config"
git push
```

## Quick Start

After installation, try these commands to explore the setup:
- `nvim` - Open Neovim (try `:Lazy` to see plugins)
- `<Space>ff` - Find files with Telescope (in Neovim)
- `<Space>fg` - Live grep search (in Neovim)
- `<Space>gg` - Open Lazygit (in Neovim)
- `o <partial-name>` - Jump to directory with Zoxide
- `tmux` - Start a tmux session with custom config