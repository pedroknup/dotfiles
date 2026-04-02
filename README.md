# Dotfiles

Personal macOS development environment configuration files managed with symlinks. This repository contains a comprehensive Neovim setup, terminal configurations, and productivity tools for software development.

## What's Included

### 🚀 Neovim Configuration

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
~/dotfiles/
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
├── uninstall.sh                # Cleanup script
└── README.md                   # This documentation
```

## Installation

Run the install script to create symlinks from your home directory to this repository:

```bash
cd ~/dotfiles
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
