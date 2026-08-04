#!/usr/bin/env bash

set -euo pipefail

echo "================================="
echo " CywVim v1.0 - Diagnóstico"
echo "================================="
echo


echo "[Vim]"
vim --version | head -1


echo
echo "[vim-plug]"

if [[ -f "$HOME/.vim/autoload/plug.vim" ]]; then
    echo "OK"
else
    echo "ERROR"
fi


check_files() {

    local title="$1"
    local directory="$2"

    shift 2

    echo
    echo "[$title]"

    for file in "$@"
    do
        if [[ -f "$directory/$file" ]]; then
            echo "$file OK"
        else
            echo "$file ERROR"
        fi
    done
}


check_files \
"Configuración" \
"$HOME/.vim/config" \
general.vim \
appearance.vim \
editing.vim \
search.vim \
filetypes.vim



check_files \
"Plugins configuración" \
"$HOME/.vim/plugins" \
plugins.vim \
colors.vim \
nerdtree.vim \
airline.vim \
git.vim \
autopairs.vim \
coc.vim \
mappings.vim



echo
echo "[Plugins instalados]"

vim +PlugStatus +qall


echo
echo "================================="
echo " Diagnóstico terminado"
echo "================================="
