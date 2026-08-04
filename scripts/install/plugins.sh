#!/usr/bin/env bash

# ==================================================
# CywVim
# Instalación de plugins
# ==================================================

set -euo pipefail

install_plugins() {

    cyw_info "Instalando plugins Vim..."

    cyw_require_command vim

    if [[ ! -f "$HOME/.vim/autoload/plug.vim" ]]; then
        cyw_fatal "vim-plug no está instalado."
    fi

    cyw_run vim \
        +'PlugInstall --sync' \
        +qa

    cyw_success "Plugins instalados."

}
