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

    cyw_info "Actualizando repositorios..."

    cyw_run_sudo apt update

    cyw_info "Instalando paquetes..."

    cyw_run_sudo apt install -y "${packages[@]}"

    cyw_success "Dependencias instaladas."

}
