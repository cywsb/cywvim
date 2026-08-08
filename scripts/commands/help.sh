#!/usr/bin/env bash

# ==================================================
# CywVim
# Ayuda
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
# Ayuda
# ==================================================

main() {

    cyw_banner

    cat <<EOF

Uso:

    cywvim <comando>

Comandos disponibles:

    install      Instalar CywVim
    update       Actualizar plugins y extensiones
    check        Verificar la instalación
    uninstall    Desinstalar CywVim
    version      Mostrar información de la versión
    help         Mostrar esta ayuda

Ejemplos:

    cywvim install
    cywvim check
    cywvim update
    cywvim uninstall

EOF

}

main "$@"
