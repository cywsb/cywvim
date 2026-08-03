#!/usr/bin/env bash

# ==================================================
# CywVim
# Sistema de backups
# ==================================================

set -euo pipefail


create_backup() {

    cyw_info "Creando backup..."


    local backup_dir="$HOME/.cywvim_backup_$(date +%Y%m%d_%H%M%S)"


    mkdir -p "$backup_dir"


    if [[ -d "$HOME/.vim" ]]; then

        cyw_info "Respaldando ~/.vim"

        cp -a "$HOME/.vim" \
            "$backup_dir/"

    fi


    if [[ -f "$HOME/.vimrc" ]]; then

        cyw_info "Respaldando ~/.vimrc"

        cp "$HOME/.vimrc" \
            "$backup_dir/"

    fi


    cyw_success "Backup creado:"
    echo "$backup_dir"

}
