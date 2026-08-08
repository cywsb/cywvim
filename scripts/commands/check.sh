#!/usr/bin/env bash

# ==================================================
# CywVim
# Check principal
# ==================================================

set -euo pipefail

# ==================================================
# Directorio del proyecto
# ==================================================

readonly PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

# ==================================================
# Biblioteca común
# ==================================================

source "$PROJECT_ROOT/scripts/common.sh"

# ==================================================
# Módulos
# ==================================================

source "$PROJECT_ROOT/scripts/check/commands.sh"
source "$PROJECT_ROOT/scripts/check/dependencies.sh"
source "$PROJECT_ROOT/scripts/check/vim.sh"
source "$PROJECT_ROOT/scripts/check/plugins.sh"
source "$PROJECT_ROOT/scripts/check/coc.sh"

main() {

    # ----------------------------------------
    # Información
    # ----------------------------------------

    cyw_banner

    cyw_detect_system

    # ----------------------------------------
    # Comprobaciones
    # ----------------------------------------

    check_commands

    check_dependencies

    check_vim

    check_plugins

    check_coc

    # ----------------------------------------
    # Estadísticas
    # ----------------------------------------

    cyw_print_stats

    # ----------------------------------------
    # Finalización
    # ----------------------------------------

    echo

    cyw_success "Verificación completada."
}

main "$@"
