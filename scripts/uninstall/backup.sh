#!/usr/bin/env bash

# ==================================================
# CywVim
# Restauración de backup
# ==================================================

set -euo pipefail

restore_backup() {

    local backup

    backup=$(find "$HOME" \
        -maxdepth 1 \
        -type d \
        -name ".cywvim_backup_*" \
        | sort \
        | tail -n1)

    if [[ -z "$backup" ]]; then

        cyw_warning "No se encontró ningún backup."

        return

    fi

    echo

    cyw_info "Backup encontrado:"
    echo "  $backup"

    echo

    if ! cyw_confirm "¿Desea restaurar el último backup?"; then

        return

    fi

    cyw_info "Restaurando configuración..."

    if cyw_dir_exists "$backup/.vim"; then

        cyw_copy_dir \
            "$backup/.vim" \
            "$HOME"

    fi

    if cyw_file_exists "$backup/.vimrc"; then

        cyw_copy_file \
            "$backup/.vimrc" \
            "$HOME/.vimrc"

    fi

    cyw_success "Backup restaurado."

}
