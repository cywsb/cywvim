#!/usr/bin/env bash

# ==================================================
# CywVim
# Instalación vim-plug
# ==================================================

set -euo pipefail


install_vim_plug() {

    cyw_info "Instalando vim-plug..."


    local plug_path="$HOME/.vim/autoload/plug.vim"


    if [[ -f "$plug_path" ]]; then

        cyw_success "vim-plug ya está instalado."

        return

    fi


    mkdir -p "$(dirname "$plug_path")"


    curl -fLo "$plug_path" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


    if [[ -f "$plug_path" ]]; then

        cyw_success "vim-plug instalado."

    else

        cyw_fatal "No se pudo instalar vim-plug."

    fi

}
