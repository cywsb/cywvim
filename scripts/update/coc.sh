#!/usr/bin/env bash

# ==================================================
# CywVim
# Actualización de extensiones COC
# ==================================================

set -euo pipefail

update_coc_extensions() {

    cyw_info "Actualizando extensiones COC.nvim..."

    cyw_require_command vim

    local extensions_file="$RESOURCES_DIR/coc_extensions.txt"

    if ! cyw_file_exists "$extensions_file"; then
        cyw_fatal "No existe: $extensions_file"
    fi

    mapfile -t extensions < <(
        read_list_file "$extensions_file"
    )

    if [[ ${#extensions[@]} -eq 0 ]]; then
        cyw_warning "No hay extensiones definidas."
        return
    fi

    local cmd=""

    for ext in "${extensions[@]}"; do
        cmd+="CocInstall -sync ${ext}|"
    done

    cmd+="qa"

    cyw_run_vim -c "$cmd"

    cyw_success "Extensiones COC actualizadas."

}
