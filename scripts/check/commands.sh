#!/usr/bin/env bash

# ==================================================
# CywVim
# Verificación de comandos
# ==================================================

set -euo pipefail

check_commands() {

    cyw_info "Verificando comandos básicos..."

    local commands=(
        vim
        git
        curl
    )

    for cmd in "${commands[@]}"; do

        if cyw_command_exists "$cmd"; then

            cyw_ok "$cmd"

        else

            cyw_warn "$cmd"

        fi

    done

    echo

}

