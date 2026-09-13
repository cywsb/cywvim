#!/usr/bin/env bash

# ==================================================
# CywVim
# Instalación de Node.js
# ==================================================

set -euo pipefail

install_node() {

    cyw_info "Verificando Node.js..."

    # --------------------------------------------------
    # Verificar Node.js existente
    # --------------------------------------------------

    if cyw_command_exists node; then

        local node_version

        node_version="$(node --version | sed 's/^v//')"

        if cyw_version_ge "$node_version" "$NODE_MIN_VERSION"; then

            cyw_success "Node.js v$node_version"

            return

        fi

        cyw_warn \
            "Node.js v$node_version es inferior al mínimo requerido: $NODE_MIN_VERSION"

    else

        cyw_info "Node.js no está instalado."

    fi

    # --------------------------------------------------
    # Verificar distribución
    # --------------------------------------------------

    case "${ID:-}" in
        debian|ubuntu|linuxmint)
            ;;
        arch|cachyos|manjaro)
            cyw_require_command pacman

            cyw_info "Instalando Node.js y npm..."
            cyw_run_sudo pacman -S --needed --noconfirm nodejs npm

            if ! cyw_command_exists node; then
                cyw_fatal "Node.js no pudo ser instalado."
            fi

            node_version="$(node --version | sed 's/^v//')"

            if ! cyw_version_ge "$node_version" "$NODE_MIN_VERSION"; then
                cyw_fatal "La versión instalada de Node.js ($node_version) no cumple el mínimo requerido ($NODE_MIN_VERSION)."
            fi

            echo
            cyw_success "Node.js v$node_version instalado correctamente."
            return
            ;;
        fedora|rhel)
            cyw_fatal "Instalación automática de Node.js no implementada para: ${ID:-desconocida}"
            ;;
        *)
            cyw_fatal "Distribución no soportada: ${ID:-desconocida}"
            ;;
    esac

    # --------------------------------------------------
    # Verificar dependencias
    # --------------------------------------------------

    cyw_require_command curl
    cyw_require_command apt

    # --------------------------------------------------
    # Configurar NodeSource
    # --------------------------------------------------

    cyw_info \
        "Configurando NodeSource para Node.js $NODE_MIN_VERSION..."

    cyw_run_sudo bash -c \
        "curl -fsSL https://deb.nodesource.com/setup_${NODE_MIN_VERSION}.x | bash -"

    # --------------------------------------------------
    # Instalar Node.js
    # --------------------------------------------------

    cyw_info "Instalando Node.js..."

    cyw_run_sudo apt install -y nodejs

    # --------------------------------------------------
    # Verificar instalación
    # --------------------------------------------------

    if ! cyw_command_exists node; then

        cyw_fatal "Node.js no pudo ser instalado."

    fi

    node_version="$(node --version | sed 's/^v//')"

    if ! cyw_version_ge "$node_version" "$NODE_MIN_VERSION"; then

        cyw_fatal \
            "La versión instalada de Node.js ($node_version) no cumple el mínimo requerido ($NODE_MIN_VERSION)."

    fi

    echo

    cyw_success "Node.js v$node_version instalado correctamente."

}
