#!/usr/bin/env bash

# ==================================================
# CywVim
# Actualizador principal
# ==================================================

set -euo pipefail

# ==================================================
# Directorio del proyecto
# ==================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

# ==================================================
# Biblioteca común
# ==================================================

source "$SCRIPT_DIR/scripts/common.sh"

# ==================================================
# Módulos
# ==================================================

source "$SCRIPT_DIR/scripts/update/plugins.sh"

source "$SCRIPT_DIR/scripts/update/coc.sh"

# ==================================================
# Actualización
# ==================================================

main() {

    cyw_banner

    cyw_detect_system

    update_plugins

    update_coc_extensions

    cyw_success "CywVim actualizado correctamente."

}

main "$@"
