#!/usr/bin/env bash

# ==================================================
# CywVim
# Test de salud del proyecto
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

check_dir() {

    local dir="$1"

    if [[ -d "$SCRIPT_DIR/$dir" ]]; then

        test_ok "Directorio: $dir"

    else

        test_fail "Directorio faltante: $dir"

    fi

}

echo
echo "=================================================="
echo " CywVim - Test de salud"
echo "=================================================="
echo

# --------------------------------------------------
# Archivos principales
# --------------------------------------------------

check_file "VERSION"
check_file "README.md"
check_file "CHANGELOG.md"
check_file "LICENSE"

# --------------------------------------------------
# CLI
# --------------------------------------------------

check_file "bin/cywvim"

# --------------------------------------------------
# Recursos
# --------------------------------------------------

check_dir "resources"

check_file "resources/defaults.conf"
check_file "resources/versions.conf"
check_file "resources/coc_extensions.txt"
check_file "resources/vimrc_loader"

# --------------------------------------------------
# Scripts
# --------------------------------------------------

check_file "scripts/common.sh"

check_dir "scripts/commands"
check_dir "scripts/install"
check_dir "scripts/check"
check_dir "scripts/update"
check_dir "scripts/uninstall"

# --------------------------------------------------
# Configuración Vim
# --------------------------------------------------

check_file "vim/vimrc"
check_file "vim/coc-settings.json"

# --------------------------------------------------
# Documentación
# --------------------------------------------------

check_file "docs/INSTALL.md"
check_file "docs/FAQ.md"
check_file "docs/ROADMAP.md"

# --------------------------------------------------
# Tests
# --------------------------------------------------

check_file "tests/test_health.sh"
check_file "tests/test_install.sh"
check_file "tests/test_update.sh"

# --------------------------------------------------
# Variables principales
# --------------------------------------------------

if [[ "$CYWVIM_NAME" == "CywVim" ]]; then
    test_ok "Nombre del proyecto"
else
    test_fail "Nombre del proyecto"
fi

if [[ -n "$CYWVIM_VERSION" ]]; then
    test_ok "Versión definida: $CYWVIM_VERSION"
else
    test_fail "Versión no definida"
fi

if [[ "$NODE_MIN_VERSION" == "24" ]]; then
    test_ok "Node.js mínimo: $NODE_MIN_VERSION"
else
    test_fail "Node.js mínimo incorrecto"
fi

if [[ "$VIM_MIN_VERSION" == "9" ]]; then
    test_ok "Vim mínimo: $VIM_MIN_VERSION"
else
    test_fail "Vim mínimo incorrecto"
fi

# --------------------------------------------------
# Resultado
# --------------------------------------------------

echo
echo "=================================================="
echo " Resultado"
echo "=================================================="
echo
echo "Pruebas : $TESTS"
echo "Correctas: $PASSED"
echo "Fallidas : $FAILED"
echo

if (( FAILED > 0 )); then

    echo "[FAIL] Test de salud fallido."

    exit 1

fi

echo "[ OK ] Test de salud completado correctamente."

exit 0
