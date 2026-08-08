#!/usr/bin/env bash

# ==================================================
# CywVim
# Instalación de vim-plug
# ==================================================

set -euo pipefail

install_vim_plug() {

    local plug_file="$INSTALL_DIR/autoload/plug.vim"
    local plug_url="https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

    cyw_info "Instalando vim-plug..."

    # --------------------------------------------------
    # Verificar dependencia
    # --------------------------------------------------

    cyw_require_command curl

    # --------------------------------------------------
    # Crear directorio
    # --------------------------------------------------

    cyw_create_dir "$INSTALL_DIR/autoload"

    # --------------------------------------------------
    # Verificar instalación existente
    # --------------------------------------------------

    if cyw_file_exists "$plug_file"; then

        cyw_success "vim-plug ya está instalado."

        return

    fi

    # --------------------------------------------------
    # Descargar vim-plug
    # --------------------------------------------------

    cyw_info "Descargando vim-plug..."

    cyw_download \
        "$plug_url" \
        "$plug_file"

    # --------------------------------------------------
    # Verificar instalación
    # --------------------------------------------------

    if ! cyw_file_exists "$plug_file"; then

        cyw_fatal "No se pudo instalar vim-plug."

    fi

    # --------------------------------------------------
    # Finalización
    # --------------------------------------------------

    echo

    cyw_success "vim-plug instalado."

}

