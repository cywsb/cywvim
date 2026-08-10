#!/usr/bin/env bash

# ==================================================
# CywVim
# Información de versión
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
# Información
# ==================================================

main() {

    cyw_banner

    echo
    echo "GitHub : $CYWVIM_GITHUB"
    echo

}

main "$@"
