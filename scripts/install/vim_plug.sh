#!/usr/bin/env bash

# ==================================================
# CywVim
# Instalación de vim-plug
# ==================================================

set -euo pipefail

install_vim_plug() {

    local plug_file="$HOME/.vim/autoload/plug.vim"

    cyw_info "Instalando vim-plug..."

    cyw_create_dir "$HOME/.vim/autoload"

    if cyw_file_exists "$plug_file"; then
        cyw_success "vim-plug ya está instalado."
        return
    fi

    cyw_run curl -fLo "$plug_file" \
        --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

    cyw_success "vim-plug instalado."

}
