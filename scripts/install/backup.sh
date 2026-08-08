#!/usr/bin/env bash

# ==================================================
# CywVim
# Sistema de backups
# ==================================================

set -euo pipefail

create_backup() {

    cyw_info "Creando backup..."

    local backup_dir="$HOME/.cywvim_backup_$(date +%Y%m%d_%H%M%S)"

    cyw_create_dir "$backup_dir"

    if cyw_dir_exists "$HOME/.vim"; then

        cyw_info "Respaldando ~/.vim"

        cyw_copy_dir \
            "$HOME/.vim" \
            "$backup_dir"

    fi

    if cyw_file_exists "$HOME/.vimrc"; then

        cyw_info "Respaldando ~/.vimrc"

        cyw_copy_file \
            "$HOME/.vimrc" \
            "$backup_dir/.vimrc"

    fi

    echo

    cyw_success "Backup creado."

    echo "  $backup_dir"

}
