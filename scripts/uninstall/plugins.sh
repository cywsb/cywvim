#!/usr/bin/env bash

# ==================================================
# CywVim
# Eliminación de plugins
# ==================================================

set -euo pipefail

remove_plugins() {

    cyw_info "Eliminando plugins..."

    # --------------------------------------------------
    # Verificar plugins instalados
    # --------------------------------------------------

    if cyw_dir_exists "$INSTALL_DIR/plugged"; then

        cyw_remove "$INSTALL_DIR/plugged"

        cyw_success "Plugins eliminados."

    else

        cyw_warn "No hay plugins instalados."

    fi

}

