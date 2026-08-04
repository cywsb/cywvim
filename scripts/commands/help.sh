#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/../common.sh"

cyw_banner

cat <<EOF

Uso:

    cywvim <comando>

Comandos disponibles:

    install      Instalar CywVim
    update       Actualizar CywVim
    check        Verificar instalación
    uninstall    Desinstalar CywVim
    version      Mostrar versión
    help         Mostrar esta ayuda

EOF
