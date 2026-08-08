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

    cyw_create_dir "$INSTALL_DIR"

    # --------------------------------------------------
    # Eliminar configuración anterior de CywVim
    # --------------------------------------------------

    cyw_remove "$INSTALL_DIR/core"
    cyw_remove "$INSTALL_DIR/config"
    cyw_remove "$INSTALL_DIR/plugins"
    cyw_remove "$INSTALL_DIR/assets"
    cyw_remove "$INSTALL_DIR/vimrc"

    # --------------------------------------------------
    # Copiar archivos
    # --------------------------------------------------

    cyw_info "Copiando archivos Vim..."

    cyw_copy_dir "$CORE_DIR" "$INSTALL_DIR"

    cyw_copy_dir "$CONFIG_DIR" "$INSTALL_DIR"

    cyw_copy_dir "$PLUGINS_DIR" "$INSTALL_DIR"

    if cyw_dir_exists "$VIM_DIR/assets"; then
        cyw_copy_dir "$VIM_DIR/assets" "$INSTALL_DIR"
    fi

    cyw_copy_file \
        "$VIM_DIR/vimrc" \
        "$INSTALL_DIR/vimrc"

    # --------------------------------------------------
    # Instalar loader ~/.vimrc
    # --------------------------------------------------

    cyw_info "Instalando loader ~/.vimrc..."

    cyw_install_loader

    # --------------------------------------------------
    # Finalización
    # --------------------------------------------------

    echo

    cyw_success "Configuración instalada."

}


