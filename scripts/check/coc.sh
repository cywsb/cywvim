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

        local node_version
        node_version="$(node --version | sed 's/^v//')"

        if cyw_version_ge "$node_version" "$NODE_MIN_VERSION"; then

            cyw_ok "Node.js v$node_version"

        else

            cyw_warn \
                "Node.js v$node_version (mínimo requerido: $NODE_MIN_VERSION)"

        fi

    else

        cyw_warn "Node.js no instalado"

    fi

    # --------------------------------------------------
    # npm
    # --------------------------------------------------

    if cyw_command_exists npm; then

        local npm_version
        npm_version="$(npm --version)"

        cyw_ok "npm v$npm_version"

    else

        cyw_warn "npm no instalado"

    fi

    # --------------------------------------------------
    # Node.js crypto
    # --------------------------------------------------

    if cyw_command_exists node; then

        if node -e \
            'process.exit(typeof crypto?.randomUUID === "function" ? 0 : 1)' \
            2>/dev/null
        then

            cyw_ok "Node.js crypto.randomUUID"

        else

            cyw_warn "Node.js crypto.randomUUID no disponible"

        fi

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
