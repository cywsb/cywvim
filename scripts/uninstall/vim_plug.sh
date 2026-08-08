#!/usr/bin/env bash

# ==================================================
# CywVim
# Eliminación de vim-plug
# ==================================================

set -euo pipefail

remove_vim_plug() {

    local plug="$INSTALL_DIR/autoload/plug.vim"

    cyw_info "Eliminando vim-plug..."

    if cyw_file_exists "$plug"; then

        cyw_remove "$plug"

        cyw_success "vim-plug eliminado."

    else

        cyw_warn "vim-plug no encontrado."

    fi

}
