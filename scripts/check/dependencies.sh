#!/usr/bin/env bash

# ==================================================
# CywVim
# Verificación de dependencias
# ==================================================

set -euo pipefail

check_dependencies() {

    cyw_info "Verificando dependencias..."

    local file="$RESOURCES_DIR/check_commands.conf"

    while IFS='=' read -r package command
    do

        [[ -z "$package" ]] && continue

        if [[ -z "$command" ]]; then

            cyw_info "$package (sin comprobación automática)"
            continue

        fi

        if cyw_command_exists "$command"; then

            cyw_success "$package"

        else

            cyw_warning "$package"

        fi

    done < <(read_key_value_file "$file")

    echo

}
