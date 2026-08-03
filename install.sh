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


# ==================================================
# Cargar librería común
# ==================================================

source "$SCRIPT_DIR/scripts/common.sh"


# ==================================================
# Cargar módulos instalación
# ==================================================

source "$SCRIPT_DIR/scripts/install/backup.sh"

source "$SCRIPT_DIR/scripts/install/dependencies.sh"

source "$SCRIPT_DIR/scripts/install/vim_plug.sh"

source "$SCRIPT_DIR/scripts/install/configuration.sh"

source "$SCRIPT_DIR/scripts/install/plugins.sh"

source "$SCRIPT_DIR/scripts/install/coc.sh"



# ==================================================
# Instalación principal
# ==================================================

main() {


    cyw_banner


    detect_system


    create_backup


    install_dependencies


    install_vim_plug


    install_configuration


    install_plugins


    install_coc_extensions



    cyw_success "CywVim instalado correctamente."

}



main "$@"
