#!/usr/bin/env bash

set -euo pipefail

# ==========================================
# CywVim v1.0
# Actualizador
# ==========================================


GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'


info() {
    echo -e "${BLUE}[INFO]${NC} $1"
}


success() {
    echo -e "${GREEN}[OK]${NC} $1"
}


error() {
    echo -e "${RED}[ERROR]${NC} $1"
}


echo
echo "==============================="
echo " CywVim Update"
echo "==============================="
echo


if [ ! -d "$HOME/.vim/plugged" ]; then
    error "CywVim no parece estar instalado."
    exit 1
fi


info "Actualizando plugins..."


vim +PlugUpdate +qall


success "Plugins actualizados."


info "Actualizando extensiones COC..."


vim -c "CocUpdate" -c q


success "COC actualizado."


echo
success "CywVim actualizado correctamente."
