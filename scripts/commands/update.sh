#!/usr/bin/env bash

# ==================================================
# CywVim
# Actualizador principal
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

source "$PROJECT_ROOT/scripts/update/plugins.sh"
source "$PROJECT_ROOT/scripts/update/coc.sh"

# ==================================================
# Actualización
# ==================================================

main() {

    # ----------------------------------------
    # Información
    # ----------------------------------------

    cyw_banner

    cyw_detect_system

    # ----------------------------------------
    # Actualización
    # ----------------------------------------

    update_plugins

    update_coc_extensions

    # ----------------------------------------
    # Finalización
    # ----------------------------------------

    echo

    cyw_success "CywVim actualizado correctamente."

}

main "$@"
