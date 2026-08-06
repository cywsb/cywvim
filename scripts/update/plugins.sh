#!/usr/bin/env bash

# ==================================================
# CywVim
# Actualización de plugins
# ==================================================

set -euo pipefail

update_plugins() {

    cyw_info "Actualizando plugins Vim..."

    cyw_require_command vim

    if ! cyw_file_exists "$INSTALL_DIR/autoload/plug.vim"; then
        cyw_fatal "vim-plug no está instalado."
    fi

    cyw_vim_plug PlugUpdate

    cyw_success "Plugins actualizados."

}
