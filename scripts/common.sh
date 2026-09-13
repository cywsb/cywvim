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

readonly CYW_COC_EXTENSIONS_DIR="$HOME/.config/coc/extensions/node_modules"

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

cyw_load_os_release() {

    if [[ -f /etc/os-release ]]; then
        source /etc/os-release
    fi

}

cyw_detect_system() {

    cyw_info "Sistema detectado:"

    cyw_load_os_release

    if [[ -n "${PRETTY_NAME:-}" ]]; then

        echo "$PRETTY_NAME"

    else

        cyw_warning "No se pudo detectar la distribución."

    fi

    echo

}

# ==================================================
# Confirmaciones
# ==================================================

cyw_confirm() {

    local message="$1"
    local answer

    # Respuesta por defecto: No

    read -rp "$message [s/N]: " answer

    [[ "$answer" =~ ^[SsYy]$ ]]

}

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

    local source="$1"
    local destination="$2"

    cyw_remove "$destination/$(basename "$source")"

    cp -R "$source" "$destination"

}

cyw_remove() {

    if [[ -e "$1" ]]; then
        rm -rf "$1"
    fi

}

cyw_symlink() {

    ln -sfn "$1" "$2"

}

# ==================================================
# Recursos
# ==================================================

load_defaults() {

    local defaults="$RESOURCES_DIR/defaults.conf"

    if [[ -f "$defaults" ]]; then
        source "$defaults"
    fi

}

load_versions() {

    local versions="$RESOURCES_DIR/versions.conf"

    if [[ ! -f "$versions" ]]; then
        cyw_fatal "No existe archivo de versiones: $versions"
    fi

    source "$versions"
}

read_list_file() {

    local file="$1"

    if [[ ! -f "$file" ]]; then

        cyw_error "No existe archivo de recursos: $file"

        return 1

    fi

    grep -Ev '^\s*$|^\s*#' "$file"

}

cyw_read_list() {

    local file="$1"

    mapfile -t CYW_LIST < <(
        read_list_file "$file"
    )

}

read_key_value_file() {

    local file="$1"

    if [[ ! -f "$file" ]]; then

        cyw_error "No existe archivo: $file"

        return 1

    fi

    grep -Ev '^\s*$|^\s*#' "$file"

}

cyw_download() {

    local url="$1"
    local output="$2"

    curl -fsSL "$url" -o "$output"

}

cyw_read_version() {

    cat "$PROJECT_ROOT/VERSION"

}

# ==================================================
# Vim
# ==================================================

cyw_run_vim() {

    cyw_run vim "$@"

}

cyw_install_loader() {

    cyw_copy_file \
        "$RESOURCES_DIR/vimrc_loader" \
        "$VIMRC_FILE"

}

cyw_vim_plug() {

    local command="${1:-}"

    if [[ -z "$command" ]]; then

        cyw_fatal "No se especificó un comando vim-plug."

    fi

    cyw_run_vim \
        +"${command} --sync" \
        +qa

}

cyw_vim_coc_install() {

    local extensions=("$@")

    if [[ ${#extensions[@]} -eq 0 ]]; then

        cyw_fatal "No se especificaron extensiones COC."

    fi

    local cmd=""

    for ext in "${extensions[@]}"; do

        cmd+="CocInstall -sync ${ext}|"

    done

    cmd+="qa"

    cyw_run_vim -c "$cmd"

}

cyw_vim_coc_update() {

    cyw_run_vim \
        -c "CocUpdate" \
        -c "qa"

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

cyw_version_ge() {
    local current="$1"
    local required="$2"

    # Normalizar versiones equivalentes:
    # 9 == 9.0 == 9.0.0
    current="$(printf '%s' "$current" | sed -E 's/(\.0)+$//')"
    required="$(printf '%s' "$required" | sed -E 's/(\.0)+$//')"

    [[ "$(printf '%s\n%s\n' "$required" "$current" | sort -V | head -n1)" == "$required" ]]
}

# ==================================================
# Plugins
# ==================================================

cyw_list_plugins() {

    grep -E "^[[:space:]]*Plug '" "$PLUGINS_DIR/plugins.vim" |
        sed -E "s/^[[:space:]]*Plug '([^']+)'.*/\1/"

}

cyw_plugin_name() {

    local repo="$1"

    basename "$repo"

}

# ==================================================
# Estadísticas
# ==================================================

declare -i CYW_OK=0
declare -i CYW_WARN=0
declare -i CYW_ERROR=0

cyw_ok() {

    ((++CYW_OK))

    cyw_success "$@"

}

cyw_warn() {

    ((++CYW_WARN))

    cyw_warning "$@"

}

cyw_fail() {

    ((++CYW_ERROR))

    cyw_error "$@"

}

cyw_print_stats() {

    echo

    cyw_separator

    echo "Comprobaciones : $((CYW_OK + CYW_WARN + CYW_ERROR))"
    echo "Correctas      : $CYW_OK"
    echo "Advertencias   : $CYW_WARN"
    echo "Errores        : $CYW_ERROR"

    cyw_separator

}

# ==================================================
# Inicialización
# ==================================================

load_defaults
load_versions
