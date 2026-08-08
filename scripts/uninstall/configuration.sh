#!/usr/bin/env bash

# ==================================================
# CywVim
# Eliminación de configuración
# ==================================================

set -euo pipefail

remove_configuration() {

    cyw_info "Eliminando configuración..."

    if cyw_dir_exists "$INSTALL_DIR"; then

        cyw_remove "$INSTALL_DIR"

        cyw_success "~/.vim eliminado."

    else

        cyw_warning "~/.vim no existe."

    fi

    if cyw_file_exists "$VIMRC_FILE"; then

        cyw_remove "$VIMRC_FILE"

        cyw_success "~/.vimrc eliminado."

    else

        cyw_warning "~/.vimrc no existe."

    fi

}
