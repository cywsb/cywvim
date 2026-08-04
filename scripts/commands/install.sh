#!/usr/bin/env bash

# ==================================================
# CywVim
# Instalador principal
# ==================================================

set -euo pipefail

# ==================================================
# Directorio del proyecto
# ==================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

PROJECT_ROOT="$(cd "$SCRIPT_DIR/../.." && pwd)"

# ==================================================
# Cargar biblioteca común
# ==================================================

source "$PROJECT_ROOT/scripts/common.sh"

# ==================================================
# Cargar módulos de instalación
# ==================================================

source "$PROJECT_ROOT/scripts/install/backup.sh"
source "$PROJECT_ROOT/scripts/install/dependencies.sh"
source "$PROJECT_ROOT/scripts/install/vim_plug.sh"
source "$PROJECT_ROOT/scripts/install/configuration.sh"
source "$PROJECT_ROOT/scripts/install/plugins.sh"
source "$PROJECT_ROOT/scripts/install/coc.sh"

# ==================================================
# Instalación principal
# ==================================================

main() {

    cyw_banner

    cyw_detect_system

    create_backup

    install_dependencies

    install_vim_plug

    install_configuration

    install_plugins

    install_coc_extensions

    # ----------------------------------------
    # Finalización
    # ----------------------------------------

    cyw_success "CywVim instalado correctamente."

}

main "$@"
