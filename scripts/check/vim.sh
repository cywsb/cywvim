#!/usr/bin/env bash

# ==================================================
# CywVim
# Verificación de Vim
# ==================================================

set -euo pipefail

check_vim() {

    cyw_info "Verificando instalación de Vim..."

    # ------------------------------------------
    # ~/.vim
    # ------------------------------------------

    if cyw_dir_exists "$INSTALL_DIR"; then
        cyw_success "~/.vim"
    else
        cyw_warning "~/.vim no existe"
    fi


    # ------------------------------------------
    # ~/.vimrc
    # ------------------------------------------

    if cyw_file_exists "$VIMRC_FILE"; then
        cyw_success "~/.vimrc"
    else
        cyw_warning "~/.vimrc no existe"
    fi


    # ------------------------------------------
    # Loader
    # ------------------------------------------

    if grep -q "source ~/.vim/vimrc" "$VIMRC_FILE" 2>/dev/null; then
        cyw_success "Loader .vimrc"
    else
        cyw_warning "Loader incorrecto"
    fi


    # ------------------------------------------
    # vim-plug
    # ------------------------------------------

    if cyw_file_exists "$INSTALL_DIR/autoload/plug.vim"; then
        cyw_success "vim-plug"
    else
        cyw_warning "vim-plug no instalado"
    fi


    # ------------------------------------------
    # Configuración principal
    # ------------------------------------------

    if cyw_file_exists "$INSTALL_DIR/vimrc"; then
        cyw_success "vim/vimrc"
    else
        cyw_warning "No existe ~/.vim/vimrc"
    fi


    # ------------------------------------------
    # Directorios
    # ------------------------------------------

    for dir in core config plugins
    do

        if cyw_dir_exists "$INSTALL_DIR/$dir"; then
            cyw_success "$dir"
        else
            cyw_warning "$dir"
        fi

    done

    echo

}
