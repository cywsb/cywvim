#!/usr/bin/env bash

# ==================================================
# CywVim
# Instalación de configuración
# ==================================================

set -euo pipefail

install_configuration() {

    cyw_info "Instalando configuración CywVim..."

    # --------------------------------------------------
    # Crear directorio principal
    # --------------------------------------------------

    mkdir -p "$INSTALL_DIR"

    # --------------------------------------------------
    # Eliminar configuración anterior de CywVim
    # --------------------------------------------------

    rm -rf "$INSTALL_DIR/core"
    rm -rf "$INSTALL_DIR/config"
    rm -rf "$INSTALL_DIR/plugins"
    rm -rf "$INSTALL_DIR/assets"

    rm -f "$INSTALL_DIR/vimrc"

    # --------------------------------------------------
    # Copiar archivos
    # --------------------------------------------------

    cyw_info "Copiando archivos Vim..."

    cp -r "$CORE_DIR" \
        "$INSTALL_DIR/"

    cp -r "$CONFIG_DIR" \
        "$INSTALL_DIR/"

    cp -r "$PLUGINS_DIR" \
        "$INSTALL_DIR/"

    if [[ -d "$VIM_DIR/assets" ]]; then
        cp -r "$VIM_DIR/assets" \
            "$INSTALL_DIR/"
    fi

    cp "$VIM_DIR/vimrc" \
        "$INSTALL_DIR/"

    # --------------------------------------------------
    # Crear loader ~/.vimrc
    # --------------------------------------------------

    cyw_info "Instalando loader ~/.vimrc..."

    cat > "$VIMRC_FILE" <<'CYWVIM_LOADER'
" ==========================================
" CywVim Loader
" ==========================================

if filereadable(expand("~/.vim/vimrc"))
    source ~/.vim/vimrc
endif
CYWVIM_LOADER

    cyw_success "Configuración instalada."

}
