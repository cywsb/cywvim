#!/usr/bin/env bash

# ==================================================
# CywVim
# Instalador
# ==================================================

set -e


# ==================================================
# Directorio del proyecto
# ==================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"


# ==================================================
# Cargar librería común
# ==================================================

source "$SCRIPT_DIR/scripts/common.sh"


# ==================================================
# Variables del Instalador
# ==================================================

readonly INSTALL_DIR="$HOME/.vim"

readonly VIMRC_FILE="$HOME/.vimrc"

readonly BACKUP_DIR="$HOME/.cywvim_backup_$(date +%Y%m%d_%H%M%S)"

# ==================================================
# Funciones
# ==================================================

# --------------------------------------------------
# Crear backup de configuración existente
# --------------------------------------------------

create_backup() {

    cyw_info "Creando backup..."

    mkdir -p "$BACKUP_DIR"


    if [[ -d "$HOME/.vim" ]]; then

        cyw_info "Respaldando ~/.vim"

        cp -a "$HOME/.vim" "$BACKUP_DIR/"

    fi


    if [[ -f "$HOME/.vimrc" ]]; then

        cyw_info "Respaldando ~/.vimrc"

        cp -a "$HOME/.vimrc" "$BACKUP_DIR/"

    fi


    cyw_success "Backup creado:"
    echo "$BACKUP_DIR"

}

# --------------------------------------------------
# Instalar dependencias
# --------------------------------------------------

install_dependencies() {

    cyw_info "Instalando dependencias..."


    local packages=(
        vim
        git
        curl
        ripgrep
        fzf
        xclip
        universal-ctags
        fonts-powerline
        build-essential
    )


    if ! command -v apt >/dev/null 2>&1; then

        cyw_fatal "Este instalador actualmente requiere apt."

    fi


    cyw_info "Actualizando repositorios..."

    sudo apt update


    cyw_info "Instalando paquetes..."


    sudo apt install -y "${packages[@]}"


    cyw_success "Dependencias instaladas."

}

# --------------------------------------------------
# Instalar vim-plug
# --------------------------------------------------

install_vim_plug() {

    cyw_info "Instalando vim-plug..."


    local plug_path="$HOME/.vim/autoload/plug.vim"


    if [[ -f "$plug_path" ]]; then

        cyw_success "vim-plug ya está instalado."

        return

    fi


    mkdir -p "$(dirname "$plug_path")"


    curl -fLo "$plug_path" --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


    if [[ -f "$plug_path" ]]; then

        cyw_success "vim-plug instalado."

    else

        cyw_fatal "No se pudo instalar vim-plug."

    fi

}

# --------------------------------------------------
# Instalar configuración CywVim
# --------------------------------------------------

install_configuration() {

    cyw_info "Instalando configuración CywVim..."


    if [[ ! -d "$VIM_DIR" ]]; then

        cyw_fatal "No existe el directorio Vim del proyecto:"
        echo "$VIM_DIR"

    fi


    cyw_info "Copiando archivos Vim..."


    mkdir -p "$INSTALL_DIR"


    cp -a "$VIM_DIR/." "$INSTALL_DIR/"


    cyw_info "Instalando loader .vimrc..."

    cat > "$VIMRC_FILE" <<'CYWVIM_LOADER'

    " ==========================================
    " CywVim Loader
    " ==========================================

    if filereadable(expand("~/.vim/vimrc"))
        source ~/.vim/vimrc
    endif
CYWVIM_LOADER

    cyw_success "Configuración instalada."

}

# --------------------------------------------------
# Instalar plugins Vim
# --------------------------------------------------

install_plugins() {

    cyw_info "Instalando plugins Vim..."


    if ! command -v vim >/dev/null 2>&1; then

        cyw_fatal "Vim no está instalado."

    fi


    vim +PlugInstall +qall


    cyw_success "Plugins instalados."

}

# --------------------------------------------------
# Detectar sistema operativo
# --------------------------------------------------

detect_system() {

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
# Programa principal
# ==================================================

main() {

    detect_system
    create_backup
    install_dependencies
    install_vim_plug
    install_configuration
    install_plugins

}


main "$@"
