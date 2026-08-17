#!/usr/bin/env bash

# ==================================================
# CywVim
# Restauración de backup
# ==================================================

set -euo pipefail

restore_backup() {

    # --------------------------------------------------
    # Buscar último backup
    # --------------------------------------------------

    local backup=""

    while IFS= read -r candidate
    do

        if cyw_dir_exists "$candidate/.vim" ||
           cyw_file_exists "$candidate/.vimrc"; then

            backup="$candidate"
            break

        fi

    done < <(
        find "$HOME" \
            -maxdepth 1 \
            -type d \
            -name ".cywvim_backup_*" \
            | sort -r
    )

    if [[ -z "$backup" ]]; then

        cyw_warn "No se encontró ningún backup."

        return

    fi

    # --------------------------------------------------
    # Mostrar backup encontrado
    # --------------------------------------------------

    echo

    cyw_info "Backup encontrado:"
    echo "  $backup"

    echo

    # --------------------------------------------------
    # Confirmar restauración
    # --------------------------------------------------

    if ! cyw_confirm "¿Desea restaurar el último backup?"; then

        cyw_info "Restauración cancelada."

        return

    fi

    # --------------------------------------------------
    # Restaurar configuración
    # --------------------------------------------------

    cyw_info "Restaurando configuración..."

    local restored=false

    if cyw_dir_exists "$backup/.vim"; then

        cyw_copy_dir \
            "$backup/.vim" \
            "$HOME"

        restored=true

    fi

    if cyw_file_exists "$backup/.vimrc"; then

        cyw_copy_file \
            "$backup/.vimrc" \
            "$VIMRC_FILE"

        restored=true

    fi

    # --------------------------------------------------
    # Verificar resultado
    # --------------------------------------------------

    if [[ "$restored" != true ]]; then

        cyw_warn "El backup no contiene archivos de configuración."

        return

    fi

    cyw_success "Backup restaurado."

}

