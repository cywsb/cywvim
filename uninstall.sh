#!/usr/bin/env bash

set -euo pipefail


GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'


echo
echo "==============================="
echo " CywVim Uninstall"
echo "==============================="
echo


BACKUP=$(ls -td "$HOME"/.cywvim_backup_* 2>/dev/null | head -1 || true)


if [ -z "$BACKUP" ]; then

    echo -e "${RED}No se encontró backup.${NC}"

    exit 1

fi


echo "Último backup encontrado:"
echo "$BACKUP"

echo

read -p "¿Restaurar este backup? (s/n): " RESP


if [[ "$RESP" != "s" ]]; then

    echo "Cancelado."

    exit 0

fi



echo "Restaurando..."



if [ -f "$BACKUP/.vimrc" ]; then

    cp "$BACKUP/.vimrc" "$HOME/.vimrc"

fi



if [ -d "$BACKUP/.vim" ]; then

    rm -rf "$HOME/.vim"

    cp -r "$BACKUP/.vim" "$HOME/"

fi



echo -e "${GREEN}Restauración completada.${NC}"
