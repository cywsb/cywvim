#!/bin/bash

echo "========== 🧬 GESTIÓN DE GIT =========="
echo "¿Qué deseas hacer?"
echo "1) Subir cambios al repositorio (push)"
echo "2) Traer cambios del repositorio (pull)"
read -rp "Opción (1 o 2): " opcion

if [ "$opcion" = "1" ]; then
    echo "📦 Preparando para subir cambios..."
    git status

    # Añadir archivos con confirmación
    read -rp "¿Agregar todos los cambios detectados? (s/n): " add_all
    if [[ "${add_all,,}" == "s" ]]; then
        git add .
    else
        echo "❌ Acción cancelada."
        exit 1
    fi

    # Verificar si hay algo para commitear
    if git diff --cached --quiet; then
        echo "⚠️  No hay cambios para commitear. Saliendo."
        exit 1
    fi

    echo
    echo "📝 ¿Cómo deseas escribir el mensaje de commit?"
    echo "1) Personalizado"
    echo "2) Automático con fecha"
    read -rp "Opción (1 o 2): " tipo_commit

    if [ "$tipo_commit" = "1" ]; then
        read -rp "Escribe tu mensaje de commit: " mensaje
    else
        mensaje="Actualización automática: $(date '+%Y-%m-%d %H:%M')"
    fi

    echo "⏳ Haciendo commit..."
    git commit -m "$mensaje"

    echo "🚀 Subiendo al repositorio..."
    git push

elif [ "$opcion" = "2" ]; then
    echo "🔄 Trayendo últimos cambios..."
    git pull --rebase

else
    echo "❌ Opción inválida. Saliendo."
    exit 1
fi

