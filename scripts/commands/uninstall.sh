#!/usr/bin/env bash

# ==================================================
# CywVim
# Desinstalador principal
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

source "$PROJECT_ROOT/scripts/uninstall/plugins.sh"
source "$PROJECT_ROOT/scripts/uninstall/configuration.sh"
source "$PROJECT_ROOT/scripts/uninstall/vim_plug.sh"
source "$PROJECT_ROOT/scripts/uninstall/backup.sh"

# ==================================================
# Desinstalación
# ==================================================

main() {

    # ----------------------------------------
    # Información
    # ----------------------------------------

    cyw_banner

    cyw_detect_system

    # ----------------------------------------
    # Confirmación
    # ----------------------------------------

    if ! cyw_confirm "¿Desea desinstalar CywVim?"; then

        cyw_info "Operación cancelada."

        exit 0

    fi

    # ----------------------------------------
    # Desinstalación
    # ----------------------------------------

    remove_plugins
    remove_vim_plug
    remove_configuration

    # ----------------------------------------
    # Restauración
    # ----------------------------------------

    restore_backup

    # ----------------------------------------
    # Finalización
    # ----------------------------------------

    echo

    cyw_success "CywVim desinstalado correctamente."

}

main "$@"
