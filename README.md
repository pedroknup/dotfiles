# Dotfiles

Personal configuration files managed with symlinks.

## Structure

```
~/dev/personal/dotfiles/
├── .config/          # Neovim, tmux, and other app configs
├── .zshrc           # Zsh configuration
├── install.sh       # Installation script
├── uninstall.sh     # Uninstallation script
└── README.md        # This file
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