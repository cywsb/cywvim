#!/usr/bin/env bash

# ==================================================
# CywVim
# Eliminación de vim-plug
# ==================================================

set -euo pipefail

remove_vim_plug() {

    cyw_info "Eliminando vim-plug..."

    # --------------------------------------------------
    # Verificar instalación
    # --------------------------------------------------

    local plug="$INSTALL_DIR/autoload/plug.vim"

    if cyw_file_exists "$plug"; then

        cyw_remove "$plug"

        cyw_success "vim-plug eliminado."

    else

        cyw_warn "vim-plug no encontrado."

    fi

}

