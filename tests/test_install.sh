#!/usr/bin/env bash

# ==================================================
# CywVim
# Test de instalación
# ==================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

source "$SCRIPT_DIR/scripts/common.sh"

TESTS=0
PASSED=0
FAILED=0

test_ok() {

    ((++TESTS))
    ((++PASSED))

    echo "[ OK ] $1"

}

test_fail() {

    ((++TESTS))
    ((++FAILED))

    echo "[FAIL] $1"

}

check_file() {

    local file="$1"

    if [[ -f "$SCRIPT_DIR/$file" ]]; then
        test_ok "Archivo: $file"
    else
        test_fail "Archivo faltante: $file"
    fi

}

check_executable() {

    local file="$1"

    if [[ -x "$SCRIPT_DIR/$file" ]]; then
        test_ok "Ejecutable: $file"
    else
        test_fail "No es ejecutable: $file"
    fi

}

echo
echo "=================================================="
echo " CywVim - Test de instalación"
echo "=================================================="
echo

# --------------------------------------------------
# Instalador principal
# --------------------------------------------------

check_executable "bin/cywvim"
check_file "scripts/commands/install.sh"

# --------------------------------------------------
# Módulos de instalación
# --------------------------------------------------

check_file "scripts/install/backup.sh"
check_file "scripts/install/dependencies.sh"
check_file "scripts/install/node.sh"
check_file "scripts/install/vim_plug.sh"
check_file "scripts/install/configuration.sh"
check_file "scripts/install/plugins.sh"
check_file "scripts/install/coc.sh"

# --------------------------------------------------
# Recursos necesarios
# --------------------------------------------------

check_file "resources/defaults.conf"
check_file "resources/versions.conf"
check_file "resources/coc_extensions.txt"
check_file "resources/vimrc_loader"

check_file "resources/packages_debian.txt"
check_file "resources/packages_arch.txt"
check_file "resources/packages_fedora.txt"

# --------------------------------------------------
# Configuración Vim
# --------------------------------------------------

check_file "vim/vimrc"
check_file "vim/coc-settings.json"

# --------------------------------------------------
# Dependencias de instalación
# --------------------------------------------------

for command in bash curl; do

    if cyw_command_exists "$command"; then
        test_ok "Comando disponible: $command"
    else
        test_fail "Comando no disponible: $command"
    fi

done

# --------------------------------------------------
# Referencias del instalador
# --------------------------------------------------

INSTALLER="$SCRIPT_DIR/scripts/commands/install.sh"

MODULES=(
    "scripts/install/backup.sh"
    "scripts/install/dependencies.sh"
    "scripts/install/node.sh"
    "scripts/install/vim_plug.sh"
    "scripts/install/configuration.sh"
    "scripts/install/plugins.sh"
    "scripts/install/coc.sh"
)

for module in "${MODULES[@]}"; do

    if grep -q "$module" "$INSTALLER"; then
        test_ok "Instalador referencia: $module"
    else
        test_fail "Instalador no referencia: $module"
    fi

done

# --------------------------------------------------
# Resultado
# --------------------------------------------------

echo
echo "=================================================="
echo " Resultado"
echo "=================================================="
echo
echo "Pruebas   : $TESTS"
echo "Correctas : $PASSED"
echo "Fallidas  : $FAILED"
echo

if (( FAILED > 0 )); then

    echo "[FAIL] Test de instalación fallido."

    exit 1

fi

echo "[ OK ] Test de instalación completado correctamente."

exit 0
