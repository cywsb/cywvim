#!/usr/bin/env bash

# ==================================================
# CywVim
# Biblioteca común
# ==================================================

set -euo pipefail

# ==================================================
# Variables globales
# ==================================================

readonly CYWVIM_AUTHOR="Cyw"
readonly CYWVIM_LICENSE="MIT"
readonly CYWVIM_GITHUB="https://github.com/cywsb/cywvim"
readonly CYWVIM_NAME="CywVim"
readonly CYWVIM_VERSION="1.0.0"

readonly PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

readonly VIM_DIR="$PROJECT_ROOT/vim"

readonly CONFIG_DIR="$VIM_DIR/config"
readonly PLUGINS_DIR="$VIM_DIR/plugins"
readonly CORE_DIR="$VIM_DIR/core"
readonly INSTALL_DIR="$HOME/.vim"
readonly VIMRC_FILE="$HOME/.vimrc"

readonly DOCS_DIR="$PROJECT_ROOT/docs"
readonly TESTS_DIR="$PROJECT_ROOT/tests"

# ==================================================
# Colores
# ==================================================

readonly RED="\033[0;31m"
readonly GREEN="\033[0;32m"
readonly YELLOW="\033[1;33m"
readonly BLUE="\033[0;34m"
readonly MAGENTA="\033[0;35m"
readonly CYAN="\033[0;36m"

readonly BOLD="\033[1m"
readonly NC="\033[0m"

# ==================================================
# Mensajes
# ==================================================

cyw_info() {
    echo -e "${BLUE}[INFO]${NC} $*"
}

cyw_success() {
    echo -e "${GREEN}[ OK ]${NC} $*"
}

cyw_warning() {
    echo -e "${YELLOW}[WARN]${NC} $*"
}

cyw_error() {
    echo -e "${RED}[ERROR]${NC} $*" >&2
}

cyw_fatal() {
    cyw_error "$*"
    exit 1
}

# ==================================================
# Banner
# ==================================================

cyw_separator() {
    printf '=%.0s' {1..50}
    echo
}

cyw_banner() {
    cyw_separator
    echo "${CYWVIM_NAME} v${CYWVIM_VERSION}"
    cyw_separator
}

# ==================================================
# Confirmaciones
# ==================================================

# (Se implementará más adelante)

# ==================================================
# Sistema
# ==================================================

detect_system()
{
    cyw_info "Sistema detectado:"

    if [[ -f /etc/os-release ]]; then
        source /etc/os-release
        echo "$PRETTY_NAME"
    else
        cyw_warning "No se pudo detectar distribución."
    fi

    echo
}

#cyw_detect_os()
#cyw_detect_arch()
#cyw_detect_user()

# ==================================================
# Archivos
# ==================================================

#cyw_file_exists()

#cyw_dir_exists()

#cyw_create_dir()

#cyw_copy()

#cyw_backup()

# ==================================================
# Dependencias
# ==================================================

#cyw_command_exists()

#cyw_require_command()

# ==================================================
# Utilidades
# ==================================================

# (Se implementará más adelante)
