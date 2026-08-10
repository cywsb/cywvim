#!/usr/bin/env bash

# ==================================================
# CywVim
# Verificación de Vim
# ==================================================

set -euo pipefail

check_vim() {

    cyw_info "Verificando instalación de Vim..."

    # --------------------------------------------------
    # ~/.vim
    # --------------------------------------------------

    if cyw_dir_exists "$INSTALL_DIR"; then

        cyw_ok "~/.vim"

    else

        cyw_warn "~/.vim no existe"

    fi

    # --------------------------------------------------
    # ~/.vimrc
    # --------------------------------------------------

    if cyw_file_exists "$VIMRC_FILE"; then

        cyw_ok "~/.vimrc"

    else

        cyw_warn "~/.vimrc no existe"

    fi

    # --------------------------------------------------
    # Loader
    # --------------------------------------------------

    if cyw_file_exists "$VIMRC_FILE"; then

        if grep -q 'filereadable(expand("~/.vim/vimrc"))' "$VIMRC_FILE" \
            && grep -q 'source ~/.vim/vimrc' "$VIMRC_FILE"; then

            cyw_ok "Loader .vimrc"

        else

            cyw_warn "Loader incorrecto"

        fi

    fi

    # --------------------------------------------------
    # vim-plug
    # --------------------------------------------------

    if cyw_file_exists "$INSTALL_DIR/autoload/plug.vim"; then

        cyw_ok "vim-plug"

    else

        cyw_warn "vim-plug no instalado"

    fi

    # --------------------------------------------------
    # Configuración principal
    # --------------------------------------------------

    if cyw_file_exists "$INSTALL_DIR/vimrc"; then

        cyw_ok "~/.vim/vimrc"

    else

        cyw_warn "~/.vim/vimrc no existe"

    fi

    # --------------------------------------------------
    # Directorios
    # --------------------------------------------------

    local directories=(
        core
        config
        plugins
    )

    for dir in "${directories[@]}"; do

        if cyw_dir_exists "$INSTALL_DIR/$dir"; then

            cyw_ok "~/.vim/$dir"

        else

            cyw_warn "~/.vim/$dir"

        fi

    done

    echo

}

