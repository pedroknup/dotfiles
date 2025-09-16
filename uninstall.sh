#!/usr/bin/env bash

# Dotfiles uninstaller script
# This script removes symlinks and optionally restores backups

set -e

HOME_DIR="$HOME"

# Files and directories to unlink
FILES_TO_UNLINK=(
    ".zshrc"
    ".config"
)

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

log_info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

log_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

log_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

remove_symlink() {
    local file=$1
    local target_path="$HOME_DIR/$file"

    if [[ -L "$target_path" ]]; then
        rm "$target_path"
        log_success "Removed symlink $file"
    elif [[ -e "$target_path" ]]; then
        log_warning "$file exists but is not a symlink, leaving as-is"
    else
        log_info "$file does not exist, skipping"
    fi
}

list_backups() {
    local backup_dirs
    backup_dirs=$(find "$HOME_DIR" -maxdepth 1 -name "dotfiles-backup-*" -type d 2>/dev/null || true)

    if [[ -n "$backup_dirs" ]]; then
        log_info "Available backups:"
        echo "$backup_dirs" | while read -r dir; do
            echo "  - $(basename "$dir")"
        done
    else
        log_info "No backups found"
    fi
}

main() {
    log_info "Starting dotfiles uninstallation..."

    # Remove symlinks
    for file in "${FILES_TO_UNLINK[@]}"; do
        remove_symlink "$file"
    done

    log_success "Dotfiles uninstallation completed!"

    # Show available backups
    list_backups
    log_info "If you want to restore from a backup, manually copy files from the backup directory."
}

# Run the uninstallation if script is executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi