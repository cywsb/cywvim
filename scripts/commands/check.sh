#!/usr/bin/env bash

# ==================================================
# CywVim
# Health Check
# ==================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"

source "$SCRIPT_DIR/scripts/common.sh"

source "$SCRIPT_DIR/scripts/check/commands.sh"
source "$SCRIPT_DIR/scripts/check/dependencies.sh"
source "$SCRIPT_DIR/scripts/check/vim.sh"
source "$SCRIPT_DIR/scripts/check/plugins.sh"
source "$SCRIPT_DIR/scripts/check/coc.sh"

main() {

    cyw_banner

    cyw_detect_system

    check_commands

    check_dependencies

    check_vim

    check_plugins

    check_coc

    cyw_success "Health Check finalizado."

}

main "$@"
