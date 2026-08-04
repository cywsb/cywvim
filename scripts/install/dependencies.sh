#!/usr/bin/env bash

# ==================================================
# CywVim
# Instalación de dependencias
# ==================================================

set -euo pipefail


install_dependencies() {

    cyw_info "Instalando dependencias..."


    local packages_file=""


    case "${ID:-}" in

        debian|ubuntu|linuxmint)

            packages_file="$RESOURCES_DIR/packages_debian.txt"
            ;;


        arch|manjaro)

            packages_file="$RESOURCES_DIR/packages_arch.txt"
            ;;


        fedora|rhel)

            packages_file="$RESOURCES_DIR/packages_fedora.txt"
            ;;


        *)

            cyw_fatal "Distribución no soportada: ${ID:-desconocida}"
            ;;

    esac



    if [[ ! -f "$packages_file" ]]; then

        cyw_fatal "No existe archivo de paquetes: $packages_file"

    fi



    mapfile -t packages < <(
        read_list_file "$packages_file"
    )



    if [[ ${#packages[@]} -eq 0 ]]; then

        cyw_fatal "No hay paquetes definidos."

    fi



    cyw_info "Actualizando repositorios..."

    case "${ID:-}" in

        debian|ubuntu|linuxmint)

            cyw_run_sudo apt update

            cyw_info "Instalando paquetes..."

            cyw_run_sudo apt install -y "${packages[@]}"

            ;;


        arch|manjaro)

            cyw_info "Instalando paquetes..."

            cyw_run_sudo pacman -Sy --needed --noconfirm "${packages[@]}"

            ;;


        fedora|rhel)

            cyw_info "Instalando paquetes..."

            cyw_run_sudo dnf install -y "${packages[@]}"

            ;;

    esac



    cyw_success "Dependencias instaladas."

}
