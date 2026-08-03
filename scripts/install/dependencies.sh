#!/usr/bin/env bash

# ==================================================
# CywVim
# Instalación de dependencias
# ==================================================

set -euo pipefail


install_dependencies() {

    cyw_info "Instalando dependencias..."


    local packages=(
        vim
        git
        curl
        ripgrep
        fzf
        xclip
        universal-ctags
        fonts-powerline
        build-essential
    )


    if ! command -v apt >/dev/null 2>&1; then

        cyw_fatal "Gestor de paquetes no soportado."

    fi


    cyw_info "Actualizando repositorios..."

    sudo apt update


    cyw_info "Instalando paquetes..."


    sudo apt install -y "${packages[@]}"


    cyw_success "Dependencias instaladas."

}
