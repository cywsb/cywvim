#!/usr/bin/env bash

# ==================================================
# CywVim
# Verificación de COC.nvim
# ==================================================

set -euo pipefail

check_coc() {

    cyw_info "Verificando COC.nvim..."

    # --------------------------------------------------
    # Node.js
    # --------------------------------------------------

    if cyw_command_exists node; then

        cyw_ok "Node.js"

    else

        cyw_warn "Node.js"

    fi

    # --------------------------------------------------
    # npm
    # --------------------------------------------------

    if cyw_command_exists npm; then

        cyw_ok "npm"

    else

        cyw_warn "npm"

    fi

    # --------------------------------------------------
    # coc.nvim
    # --------------------------------------------------

    if cyw_dir_exists "$INSTALL_DIR/plugged/coc.nvim"; then

        cyw_ok "coc.nvim"

    else

        cyw_warn "coc.nvim no instalado"

    fi

    # --------------------------------------------------
    # Archivo de extensiones
    # --------------------------------------------------

    local extensions_file="$RESOURCES_DIR/coc_extensions.txt"

    if ! cyw_file_exists "$extensions_file"; then

        cyw_warn "No existe coc_extensions.txt"

        echo

        return

    fi

    # --------------------------------------------------
    # Extensiones COC
    # --------------------------------------------------

    while read -r extension
    do

        [[ -z "$extension" ]] && continue

        if cyw_dir_exists "$CYW_COC_EXTENSIONS_DIR/$extension"; then

            cyw_ok "$extension"

        else

            cyw_warn "$extension"

        fi

    done < <(read_list_file "$extensions_file")

    echo

}

