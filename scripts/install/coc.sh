#!/usr/bin/env bash

# ==================================================
# CywVim
# Instalación de extensiones COC
# ==================================================

set -euo pipefail

install_coc_extensions() {

    cyw_info "Instalando extensiones COC.nvim..."

    cyw_require_command vim

    local extensions=(
        coc-json
        coc-snippets
        coc-html
        coc-css
        coc-tsserver
        coc-pyright
        coc-sh
    )

    local cmd=""

    for ext in "${extensions[@]}"; do
        cmd+="CocInstall -sync ${ext}|"
    done

    cmd+="qa"

    cyw_run vim \
        -c "$cmd"

    cyw_success "Extensiones COC instaladas."

}
