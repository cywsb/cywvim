#!/usr/bin/env bash

# ==================================================
# CywVim
# Test de actualización
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

echo
echo "=================================================="
echo " CywVim - Test de actualización"
echo "=================================================="
echo

# --------------------------------------------------
# Actualizador principal
# --------------------------------------------------

check_file "scripts/commands/update.sh"

# --------------------------------------------------
# Módulos de actualización
# --------------------------------------------------

check_file "scripts/update/plugins.sh"
check_file "scripts/update/coc.sh"

# --------------------------------------------------
# Recursos necesarios
# --------------------------------------------------

check_file "resources/coc_extensions.txt"
check_file "resources/versions.conf"

# --------------------------------------------------
# Configuración
# --------------------------------------------------

check_file "vim/vimrc"
check_file "vim/coc-settings.json"

# --------------------------------------------------
# Verificar referencias del actualizador
# --------------------------------------------------

UPDATE_SCRIPT="$SCRIPT_DIR/scripts/commands/update.sh"

MODULES=(
    "scripts/update/plugins.sh"
    "scripts/update/coc.sh"
)

for module in "${MODULES[@]}"; do

    if grep -q "$module" "$UPDATE_SCRIPT"; then
        test_ok "Actualizador referencia: $module"
    else
        test_fail "Actualizador no referencia: $module"
    fi

done

# --------------------------------------------------
# Verificar funciones principales
# --------------------------------------------------

PLUGIN_UPDATE="$SCRIPT_DIR/scripts/update/plugins.sh"
COC_UPDATE="$SCRIPT_DIR/scripts/update/coc.sh"

if grep -q "update_plugins()" "$PLUGIN_UPDATE"; then
    test_ok "Función update_plugins"
else
    test_fail "Función update_plugins no encontrada"
fi

if grep -q "update_coc_extensions()" "$COC_UPDATE"; then
    test_ok "Función update_coc_extensions"
else
    test_fail "Función update_coc_extensions no encontrada"
fi

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

    echo "[FAIL] Test de actualización fallido."

    exit 1

fi

echo "[ OK ] Test de actualización completado correctamente."

exit 0
