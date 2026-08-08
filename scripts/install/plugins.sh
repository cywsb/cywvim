#!/usr/bin/env bash

# ==================================================
# CywVim
# Instalación de plugins
# ==================================================

set -euo pipefail

install_plugins() {

    cyw_info "Instalando plugins Vim..."

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
    # Instalar plugins
    # --------------------------------------------------

    cyw_vim_plug PlugInstall

    # --------------------------------------------------
    # Finalización
    # --------------------------------------------------

    echo

    cyw_success "Plugins instalados."

}

