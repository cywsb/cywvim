#!/usr/bin/env bash

# ==================================================
# CywVim
# Biblioteca común
# ==================================================

set -euo pipefail

# ==================================================
# Directorios del proyecto
# ==================================================

readonly PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
readonly RESOURCES_DIR="$PROJECT_ROOT/resources"

readonly VIM_DIR="$PROJECT_ROOT/vim"

readonly CORE_DIR="$VIM_DIR/core"
readonly CONFIG_DIR="$VIM_DIR/config"
readonly PLUGINS_DIR="$VIM_DIR/plugins"

readonly DOCS_DIR="$PROJECT_ROOT/docs"
readonly TESTS_DIR="$PROJECT_ROOT/tests"

# ==================================================
# Directorios del usuario
# ==================================================

readonly INSTALL_DIR="$HOME/.vim"
readonly VIMRC_FILE="$HOME/.vimrc"

# ==================================================
# Información del proyecto
# ==================================================

readonly CYWVIM_NAME="CywVim"
readonly CYWVIM_VERSION="$(<"$PROJECT_ROOT/VERSION")"

readonly CYWVIM_AUTHOR="Cyw"
readonly CYWVIM_LICENSE="MIT"
readonly CYWVIM_GITHUB="https://github.com/cywsb/cywvim"

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

    echo
    echo " ${CYWVIM_NAME}"
    echo
    echo " Version : ${CYWVIM_VERSION}"
    echo " Autor   : ${CYWVIM_AUTHOR}"
    echo " Licencia: ${CYWVIM_LICENSE}"
    echo

    cyw_separator
}

# ==================================================
# Sistema
# ==================================================

cyw_detect_system() {

    cyw_info "Sistema detectado:"

    if [[ -f /etc/os-release ]]; then

        . /etc/os-release

        echo "$PRETTY_NAME"

    else

        cyw_warning "No se pudo detectar la distribución."

    fi

    echo

}

# ==================================================
# Confirmaciones
# ==================================================

# (Se implementará más adelante)

# ==================================================
# Archivos
# ==================================================

cyw_file_exists() {

    [[ -f "$1" ]]

}

cyw_dir_exists() {

    [[ -d "$1" ]]

}

cyw_create_dir() {

    mkdir -p "$1"

}

cyw_create_dirs() {

    mkdir -p "$@"

}

cyw_copy_file() {

    cp "$1" "$2"

}

cyw_copy_dir() {

    cp -R "$1" "$2"

}

cyw_remove() {

    rm -rf "$1"

}

# ==================================================
# Dependencias
# ==================================================

# cyw_command_exists()
# cyw_require_command()

# ==================================================
# Utilidades
# ==================================================

# (Se implementará más adelante)

# ==================================================
# Recursos
# ==================================================

load_defaults() {

    local defaults="$RESOURCES_DIR/defaults.conf"

    if [[ -f "$defaults" ]]; then
        source "$defaults"
    fi

}


read_list_file() {

    local file="$1"

    if [[ ! -f "$file" ]]; then
        cyw_error "No existe archivo de recursos: $file"
        return 1
    fi


    grep -Ev '^\s*$|^\s*#' "$file"

}

# ==================================================
# Comandos
# ==================================================

cyw_run() {

    "$@"

}

cyw_run_sudo() {

    sudo "$@"

}

cyw_command_exists() {

    command -v "$1" >/dev/null 2>&1

}

cyw_require_command() {

    if ! cyw_command_exists "$1"; then
        cyw_fatal "No se encontró el comando: $1"
    fi

}
