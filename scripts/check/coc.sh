#!/usr/bin/env bash

# ==================================================
# CywVim
# Verificación de COC.nvim
# ==================================================

set -euo pipefail

check_coc() {

    cyw_info "Verificando COC.nvim..."

    # ------------------------------------------
    # Node.js
    # ------------------------------------------

    if cyw_command_exists node; then
        cyw_ok "Node.js"
    else
        cyw_warn "Node.js"
    fi

    # ------------------------------------------
    # npm
    # ------------------------------------------

    if cyw_command_exists npm; then
        cyw_ok "npm"
    else
        cyw_warn "npm"
    fi

    # ------------------------------------------
    # Extensiones
    # ------------------------------------------

    local extensions_file="$RESOURCES_DIR/coc_extensions.txt"

    if [[ ! -f "$extensions_file" ]]; then

        cyw_warning "No existe coc_extensions.txt"
        echo
        return

    fi

    while read -r extension
    do

        [[ -z "$extension" ]] && continue

        if [[ -d "$HOME/.config/coc/extensions/node_modules/$extension" ]]; then

            cyw_ok "$extension"

        else

            cyw_warn "$extension"

        fi

    done < <(read_list_file "$extensions_file")

    echo

}
