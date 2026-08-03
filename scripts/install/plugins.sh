#!/usr/bin/env bash

# ==================================================
# CywVim
# Instalación de plugins Vim
# ==================================================

set -euo pipefail


install_plugins() {

    cyw_info "Instalando plugins Vim..."


    if ! command -v vim >/dev/null 2>&1; then

        cyw_fatal "Vim no está instalado."

    fi


    vim +PlugInstall +qall


    cyw_success "Plugins instalados."

}
