#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$SCRIPT_DIR/../common.sh"

cyw_banner

echo
echo "Versión : $CYWVIM_VERSION"
echo "Autor   : $CYWVIM_AUTHOR"
echo "Licencia: $CYWVIM_LICENSE"
echo "GitHub  : $CYWVIM_GITHUB"
echo
