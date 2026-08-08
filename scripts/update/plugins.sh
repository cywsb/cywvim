#!/usr/bin/env bash

# ==================================================
# CywVim
# Actualización de plugins
# ==================================================

set -euo pipefail

update_plugins() {

    cyw_info "Actualizando plugins Vim..."

    # --------------------------------------------------
    # Verificar dependencias
    # --------------------------------------------------

    cyw_require_command vim

    # --------------------------------------------------
    # Verificar vim-plug
    # --------------------------------------------------

    local plug_file="$INSTALL_DIR/autoload/plug.vim"

    if ! cyw_file_exists "$plug_file"; then

        cyw_fatal "vim-plug no está instalado."

    fi

    # --------------------------------------------------
    # Actualizar plugins
    # --------------------------------------------------

    cyw_vim_plug PlugUpdate

    # --------------------------------------------------
    # Finalización
    # --------------------------------------------------

    echo

    cyw_success "Plugins actualizados."

}

