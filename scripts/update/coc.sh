#!/usr/bin/env bash

# ==================================================
# CywVim
# Actualización de extensiones COC
# ==================================================

set -euo pipefail

update_coc_extensions() {

    cyw_info "Actualizando extensiones COC.nvim..."

    # --------------------------------------------------
    # Verificar dependencias
    # --------------------------------------------------

    cyw_require_command vim

    # --------------------------------------------------
    # Actualizar extensiones
    # --------------------------------------------------

    cyw_vim_coc_update

    # --------------------------------------------------
    # Finalización
    # --------------------------------------------------

    echo

    cyw_success "Extensiones COC actualizadas."

}

