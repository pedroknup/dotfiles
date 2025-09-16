#!/usr/bin/env bash

# Dotfiles installer script
# This script creates symlinks from the home directory to files in the dotfiles repository

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOME_DIR="$HOME"

# Files and directories to symlink
FILES_TO_LINK=(
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

create_backup() {
    local file=$1
    local backup_dir="$HOME_DIR/dotfiles-backup-$(date +%Y%m%d_%H%M%S)"

    if [[ -e "$HOME_DIR/$file" ]]; then
        if [[ ! -d "$backup_dir" ]]; then
            mkdir -p "$backup_dir"
            log_info "Created backup directory: $backup_dir"
        fi

        cp -r "$HOME_DIR/$file" "$backup_dir/"
        log_warning "Backed up existing $file to $backup_dir"
    fi
}

create_symlink() {
    local file=$1
    local source_path="$DOTFILES_DIR/$file"
    local target_path="$HOME_DIR/$file"

    # Check if source exists
    if [[ ! -e "$source_path" ]]; then
        log_error "Source file $source_path does not exist"
        return 1
    fi

    # Create backup if target exists and is not already a symlink to our source
    if [[ -e "$target_path" && ! -L "$target_path" ]] || [[ -L "$target_path" && "$(readlink "$target_path")" != "$source_path" ]]; then
        create_backup "$file"
        rm -rf "$target_path"
    fi

    # Create symlink
    ln -sf "$source_path" "$target_path"
    log_success "Linked $file"
}

main() {
    log_info "Starting dotfiles installation..."
    log_info "Dotfiles directory: $DOTFILES_DIR"
    log_info "Home directory: $HOME_DIR"

    # Create symlinks for all files
    for file in "${FILES_TO_LINK[@]}"; do
        create_symlink "$file"
    done

    log_success "Dotfiles installation completed!"
    log_info "Your configuration files are now symlinked to the dotfiles repository."
    log_info "Any changes you make will be tracked in the repository."
}

# Run the installation if script is executed directly
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi