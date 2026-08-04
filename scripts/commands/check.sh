#!/usr/bin/env bash

echo "================================="
echo " CywVim v1.0 - Diagnóstico"
echo "================================="
echo


echo "[Vim]"
vim --version | head -1


echo
echo "[vim-plug]"

if [ -f ~/.vim/autoload/plug.vim ]; then
    echo "OK"
else
    echo "ERROR"
fi


echo
echo "[Configuración]"

for file in \
general.vim \
appearance.vim \
plugins.vim \
nerdtree.vim \
airline.vim \
coc.vim \
mappings.vim
do

    if [ -f ~/.vim/config/$file ]; then
        echo "$file OK"
    else
        echo "$file ERROR"
    fi

done


echo
echo "[Plugins]"

vim +PlugStatus +qall


echo
echo "================================="
echo " Diagnóstico terminado"
echo "================================="
