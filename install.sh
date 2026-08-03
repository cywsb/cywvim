#!/usr/bin/env bash

set -euo pipefail

# ==========================================
# CywVim v1.0
# Instalador de Vim personalizado
# Debian / Ubuntu / Linux Mint
# ==========================================

VERSION="1.0"

# Colores
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m'


info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

success() {
    echo -e "${GREEN}[OK]${NC} $1"
}

warning() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

error() {
    echo -e "${RED}[ERROR]${NC} $1"
}


# ==========================================
# Comprobar sistema
# ==========================================

if [ ! -f /etc/os-release ]; then
    error "No se pudo detectar la distribución."
    exit 1
fi

source /etc/os-release

info "Sistema detectado:"
echo "$PRETTY_NAME"


# ==========================================
# Dependencias
# ==========================================

install_packages() {

    info "Actualizando repositorios..."

    sudo apt update


    info "Instalando dependencias..."

    sudo apt install -y \
        vim \
        git \
        curl \
        ripgrep \
        fzf \
        xclip \
        universal-ctags \
        fonts-powerline \
        build-essential


    success "Dependencias instaladas."
}


# ==========================================
# Backup
# ==========================================

backup_old_config() {

    DATE=$(date +"%Y%m%d_%H%M%S")

    BACKUP="$HOME/.cywvim_backup_$DATE"

    mkdir -p "$BACKUP"


    if [ -f "$HOME/.vimrc" ]; then
        cp "$HOME/.vimrc" "$BACKUP/"
    fi


    if [ -d "$HOME/.vim" ]; then
        cp -r "$HOME/.vim" "$BACKUP/"
    fi


    success "Backup creado en:"
    echo "$BACKUP"
}


# ==========================================
# vim-plug
# ==========================================

install_vimplug() {

    info "Instalando vim-plug..."

    curl -fLo \
    "$HOME/.vim/autoload/plug.vim" \
    --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


    success "vim-plug instalado."
}


# ==========================================
# Copiar configuración
# ==========================================

install_config() {

    info "Instalando configuración CywVim..."


    # Crear estructura Vim

    mkdir -p "$HOME/.vim"

    mkdir -p "$HOME/.vim/config"

    mkdir -p "$HOME/.vim/backup"

    mkdir -p "$HOME/.vim/swap"

    mkdir -p "$HOME/.vim/undo"

    mkdir -p "$HOME/.vim/plugged"



    # Copiar vimrc

    cp vimrc "$HOME/.vimrc"



    # Copiar módulos

    cp config/*.vim "$HOME/.vim/config/"



    # Configuración COC

    cp coc-settings.json "$HOME/.vim/coc-settings.json"



    success "Configuración instalada."
}

# ==========================================
# Plugins
# ==========================================

install_plugins() {

    info "Instalando plugins Vim..."

    vim +PlugInstall +qall || true

    success "Plugins instalados."
}


# ==========================================
# MAIN
# ==========================================

echo
echo "================================="
echo " CywVim v$VERSION"
echo " Instalación"
echo "================================="
echo


backup_old_config

install_packages

install_vimplug

install_config

install_plugins


echo
success "CywVim instalado correctamente."
echo
echo "Cierra y abre Vim nuevamente."


echo
echo "================================="
echo " Verificación"
echo "================================="


echo

echo "Vim:"
vim --version | head -1


echo

echo "Configuración:"
ls ~/.vim/config


echo

echo "CywVim instalado."


