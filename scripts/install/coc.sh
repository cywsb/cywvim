#!/usr/bin/env bash

# ==================================================
# CywVim
# Instalación de extensiones COC.nvim
# ==================================================

set -euo pipefail

install_coc_extensions() {

    cyw_info "Instalando extensiones COC.nvim..."

    # --------------------------------------------------
    # Verificar dependencias
    # --------------------------------------------------

    cyw_require_command vim
    cyw_require_command node

    # --------------------------------------------------
    # Leer recursos
    # --------------------------------------------------

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

    # --------------------------------------------------
    # Extensiones encontradas
    # --------------------------------------------------

    for extension in "${extensions[@]}"; do
        cyw_info "  • $extension"
    done

    # --------------------------------------------------
    # Instalar extensiones
    # --------------------------------------------------

    cyw_vim_coc_install "${extensions[@]}"

    cyw_success "Extensiones COC instaladas."

}
