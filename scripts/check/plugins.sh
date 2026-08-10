#!/usr/bin/env bash

# ==================================================
# CywVim
# Verificación de plugins
# ==================================================

set -euo pipefail

check_plugins() {

    cyw_info "Verificando plugins..."

    # --------------------------------------------------
    # Verificar archivo de plugins
    # --------------------------------------------------

    if ! cyw_file_exists "$PLUGINS_DIR/plugins.vim"; then

        cyw_warn "No existe plugins.vim"

        echo

        return

    fi

    # --------------------------------------------------
    # Verificar plugins instalados
    # --------------------------------------------------

    while read -r repo
    do

        local plugin

        plugin="$(cyw_plugin_name "$repo")"

        if cyw_dir_exists "$INSTALL_DIR/plugged/$plugin"; then

            cyw_ok "$plugin"

        else

            cyw_warn "$plugin"

        fi

    done < <(cyw_list_plugins)

    echo

}

