#!/usr/bin/env bash

# ==================================================
# CywVim
# Verificación de dependencias
# ==================================================

set -euo pipefail

check_dependencies() {

    cyw_info "Verificando dependencias..."

    local file="$RESOURCES_DIR/check_commands.conf"

    # --------------------------------------------------
    # Verificar archivo de recursos
    # --------------------------------------------------

    if ! cyw_file_exists "$file"; then

        cyw_warn "No existe: $file"

        echo

        return

    fi

    # --------------------------------------------------
    # Leer dependencias
    # --------------------------------------------------

    while IFS='=' read -r package command
    do

        [[ -z "$package" ]] && continue

        # --------------------------------------------------
        # Dependencia sin comprobación automática
        # --------------------------------------------------

        if [[ -z "$command" ]]; then

            cyw_info "$package (sin comprobación automática)"

            continue

        fi

        # --------------------------------------------------
        # Verificar comando
        # --------------------------------------------------

        if cyw_command_exists "$command"; then

            cyw_ok "$package"

        else

            cyw_warn "$package"

        fi

    done < <(read_key_value_file "$file")

    echo

}

