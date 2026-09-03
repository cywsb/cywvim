#!/usr/bin/env bash

# ==================================================
# CywVim
# Gestión de Git
# ==================================================

set -euo pipefail

# ==================================================
# Directorio del repositorio
# ==================================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# ==================================================
# Información
# ==================================================

readonly REPO_DIR="$SCRIPT_DIR"

readonly GIT_NAME="CywSBA"
readonly GIT_EMAIL="cywsb9@gmail.com"

# ==================================================
# Colores
# ==================================================

readonly RED="\033[0;31m"
readonly GREEN="\033[0;32m"
readonly YELLOW="\033[1;33m"
readonly BLUE="\033[0;34m"
readonly NC="\033[0m"

# ==================================================
# Mensajes
# ==================================================

info() {
    echo -e "${BLUE}[INFO]${NC} $*"
}

ok() {
    echo -e "${GREEN}[ OK ]${NC} $*"
}

warn() {
    echo -e "${YELLOW}[WARN]${NC} $*"
}

error() {
    echo -e "${RED}[ERROR]${NC} $*" >&2
}

separator() {
    printf '=%.0s' {1..50}
    echo
}

# ==================================================
# Verificaciones
# ==================================================

check_user() {

    local current_user
    current_user="$(whoami)"

    info "Usuario actual: $current_user"

    if [[ "$current_user" == "root" ]]; then

        error "No ejecutes este script como root."

        echo
        echo "Ejecuta:"
        echo
        echo "    ./gestionar_git.sh"
        echo

        exit 1
    fi
}

check_repository() {

    if [[ ! -d "$REPO_DIR/.git" ]]; then

        error "No se encontró un repositorio Git."

        exit 1
    fi

    ok "Repositorio: $REPO_DIR"
}

check_git() {

    if ! command -v git >/dev/null 2>&1; then

        error "Git no está instalado."

        exit 1
    fi
}

check_permissions() {

    local owner

    owner="$(stat -c '%U' "$REPO_DIR/.git")"

    if [[ "$owner" != "$(whoami)" ]]; then

        error "El directorio .git no pertenece al usuario actual."

        echo
        echo "Propietario actual: $owner"
        echo "Usuario actual    : $(whoami)"
        echo
        echo "Para corregirlo:"
        echo
        echo "    sudo chown -R $(whoami):$(id -gn) \"$REPO_DIR/.git\""
        echo

        exit 1
    fi
}

# ==================================================
# Identidad Git
# ==================================================

configure_identity() {

    git config --local user.name "$GIT_NAME"
    git config --local user.email "$GIT_EMAIL"

    ok "Identidad Git configurada."

    echo
    echo "    Nombre : $(git config --local user.name)"
    echo "    Email  : $(git config --local user.email)"
    echo
}

# ==================================================
# Estado
# ==================================================

show_status() {

    separator

    echo
    echo " Estado del repositorio"
    echo

    separator

    echo

    git status

    echo
}

# ==================================================
# Push
# ==================================================

push_changes() {

    separator

    echo
    echo " Subir cambios al repositorio"
    echo

    separator

    echo

    configure_identity

    show_status

    read -rp "¿Agregar todos los cambios? [s/N]: " add_all

    if [[ ! "$add_all" =~ ^[SsYy]$ ]]; then

        warn "Operación cancelada."

        return
    fi

    echo
    info "Agregando cambios..."

    git add .

    if git diff --cached --quiet; then

        warn "No hay cambios para realizar un commit."

        return
    fi

    echo
    echo "Cambios preparados:"
    echo

    git diff --cached --stat

    echo
    read -rp "¿Deseas continuar con el commit? [s/N]: " confirm_commit

    if [[ ! "$confirm_commit" =~ ^[SsYy]$ ]]; then

        warn "Commit cancelado."

        return
    fi

    echo
    echo "Mensaje del commit:"
    echo
    echo "1) Personalizado"
    echo "2) Automático con fecha"
    echo

    read -rp "Opción [1-2]: " commit_type

    case "$commit_type" in

        1)

            read -rp "Mensaje: " message

            if [[ -z "$message" ]]; then

                error "El mensaje del commit no puede estar vacío."

                return 1
            fi

            ;;

        2)

            message="Actualización automática: $(date '+%Y-%m-%d %H:%M')"

            ;;

        *)

            error "Opción inválida."

            return 1

            ;;
    esac

    echo
    info "Creando commit..."

    git commit -m "$message"

    echo
    info "Subiendo cambios al repositorio..."

    git push

    echo
    ok "Cambios enviados correctamente."
}

# ==================================================
# Pull
# ==================================================

pull_changes() {

    separator

    echo
    echo " Traer cambios del repositorio"
    echo

    separator

    echo

    info "Ejecutando git pull --rebase..."

    git pull --rebase

    echo
    ok "Repositorio actualizado."
}

# ==================================================
# Configurar identidad
# ==================================================

show_identity() {

    separator

    echo
    echo " Identidad Git"
    echo

    separator

    echo

    local name
    local email

    name="$(git config --local --get user.name || true)"
    email="$(git config --local --get user.email || true)"

    if [[ -z "$name" || -z "$email" ]]; then

        warn "No existe una identidad Git local."

        configure_identity

        return
    fi

    echo "Nombre : $name"
    echo "Email  : $email"

    echo
}

# ==================================================
# Menú
# ==================================================

main() {

    check_user
    check_git
    check_repository
    check_permissions

    echo

    separator

    echo
    echo " CywVim - Gestión de Git"
    echo

    separator

    echo

    echo "Repositorio:"
    echo "  $REPO_DIR"
    echo

    echo "Usuario:"
    echo "  $(whoami)"
    echo

    echo "¿Qué deseas hacer?"
    echo
    echo "1) Subir cambios al repositorio (push)"
    echo "2) Traer cambios del repositorio (pull)"
    echo "3) Mostrar estado"
    echo "4) Configurar identidad Git"
    echo "5) Mostrar identidad Git"
    echo "6) Salir"
    echo

    read -rp "Opción [1-6]: " option

    case "$option" in

        1)
            push_changes
            ;;

        2)
            pull_changes
            ;;

        3)
            show_status
            ;;

        4)
            configure_identity
            ;;

        5)
            show_identity
            ;;

        6)
            info "Saliendo."
            ;;

        *)
            error "Opción inválida."
            exit 1
            ;;

    esac
}

main "$@"

