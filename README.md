# CywVim

Configuración modular y automatizada de Vim para Debian y Linux Mint.

CywVim proporciona una instalación organizada de Vim, plugins y herramientas
de desarrollo mediante una interfaz sencilla desde la línea de comandos.

## Versión

**1.0.0**

## Características

- Configuración modular de Vim
- Instalación automatizada
- Sistema de backup antes de instalar
- Restauración de configuración al desinstalar
- vim-plug
- Gruvbox
- NERDTree
- Airline
- GitGutter
- FZF
- COC.nvim

### Lenguajes y tecnologías

COC.nvim permite trabajar con:

- Python
- Flask
- HTML
- CSS
- JavaScript / TypeScript
- YAML
- JSON
- Bash

## Requisitos

CywVim está diseñado principalmente para:

- Debian
- Linux Mint
- Sistemas basados en Debian compatibles

Se requiere:

- Bash
- Vim
- curl
- apt
- conexión a Internet

Para COC.nvim se requiere una versión compatible de Node.js.

CywVim utiliza Node.js 24 como versión mínima.

## Instalación

Clona el repositorio:

```bash
git clone https://github.com/cywsb/cywvim.git
```

Entra al directorio:

```bash
cd cywvim
```

Ejecuta el instalador:

```bash
./bin/cywvim install
```

Durante la instalación CywVim:

1. Detecta el sistema operativo.
2. Crea un backup de la configuración existente.
3. Instala las dependencias necesarias.
4. Comprueba e instala Node.js si es necesario.
5. Instala vim-plug.
6. Instala la configuración de Vim.
7. Instala los plugins.
8. Instala las extensiones de COC.nvim.

## Comandos

CywVim dispone de los siguientes comandos:

```text
cywvim install
cywvim update
cywvim check
cywvim uninstall
cywvim version
cywvim help
```

### Instalar

```bash
./bin/cywvim install
```

Instala CywVim y configura Vim.

### Actualizar

```bash
./bin/cywvim update
```

Actualiza los plugins y las extensiones de COC.nvim.

### Comprobar

```bash
./bin/cywvim check
```

Comprueba el estado de la instalación.

### Desinstalar

```bash
./bin/cywvim uninstall
```

Elimina la configuración de CywVim y ofrece restaurar el último backup
encontrado.

### Versión

```bash
./bin/cywvim version
```

Muestra información de CywVim.

### Ayuda

```bash
./bin/cywvim help
```

Muestra los comandos disponibles.

## Backup

Antes de instalar CywVim se crea un backup de la configuración existente.

El backup se almacena en el directorio personal del usuario con un nombre
similar a:

```text
~/.cywvim_backup_YYYYMMDD_HHMMSS
```

El backup puede contener:

```text
.vim
.vimrc
```

Al desinstalar CywVim se busca automáticamente el backup más reciente y se
ofrece restaurarlo.

## Estructura del proyecto

```text
cywvim/
├── bin/
│   └── cywvim
│
├── docs/
│   ├── FAQ.md
│   ├── INSTALL.md
│   └── ROADMAP.md
│
├── resources/
│   ├── coc_extensions.txt
│   ├── defaults.conf
│   ├── packages_arch.txt
│   ├── packages_debian.txt
│   ├── packages_fedora.txt
│   ├── versions.conf
│   └── vimrc_loader
│
├── scripts/
│   ├── check/
│   ├── commands/
│   ├── install/
│   ├── uninstall/
│   ├── update/
│   └── common.sh
│
├── tests/
│   ├── test_health.sh
│   ├── test_install.sh
│   └── test_update.sh
│
├── vim/
│   ├── coc-settings.json
│   └── vimrc
│
├── CHANGELOG.md
├── LICENSE
├── README.md
├── VERSION
└── gestionar_git.sh
```

## Arquitectura

CywVim utiliza una arquitectura modular.

El comando principal:

```text
bin/cywvim
```

actúa como interfaz de línea de comandos y delega cada operación a su
correspondiente módulo.

Los comandos principales se encuentran en:

```text
scripts/commands/
```

Los módulos de instalación se encuentran en:

```text
scripts/install/
```

Los módulos de comprobación se encuentran en:

```text
scripts/check/
```

Los módulos de actualización se encuentran en:

```text
scripts/update/
```

Los módulos de desinstalación se encuentran en:

```text
scripts/uninstall/
```

Las funciones compartidas se encuentran en:

```text
scripts/common.sh
```

## Configuración

La configuración de Vim se encuentra en:

```text
vim/vimrc
```

Las configuraciones relacionadas con COC.nvim se encuentran en:

```text
vim/coc-settings.json
```

Las versiones mínimas utilizadas por CywVim se definen en:

```text
resources/versions.conf
```

Actualmente:

```text
NODE_MIN_VERSION=24
VIM_MIN_VERSION=9
```

## COC.nvim

CywVim utiliza COC.nvim como sistema de soporte para diferentes lenguajes.

Las extensiones utilizadas se encuentran definidas en:

```text
resources/coc_extensions.txt
```

Entre ellas se incluyen herramientas para:

- Python
- HTML
- CSS
- JavaScript / TypeScript
- JSON
- Bash
- Snippets

## Comprobación de la instalación

Después de instalar CywVim se recomienda ejecutar:

```bash
./bin/cywvim check
```

Este comando comprueba componentes como:

- versión de Vim
- configuración de Vim
- vim-plug
- COC.nvim
- Node.js
- npm
- `crypto.randomUUID`
- extensiones de COC.nvim

## Desinstalación

Para eliminar CywVim:

```bash
./bin/cywvim uninstall
```

El proceso:

1. Solicita confirmación.
2. Elimina la configuración de CywVim.
3. Busca el último backup disponible.
4. Ofrece restaurarlo.

## Desarrollo

El proyecto está organizado para facilitar futuras versiones y modificaciones
sin tener que mantener un único script monolítico.

Antes de realizar cambios se recomienda comprobar el estado del repositorio:

```bash
git status
```

Para revisar los últimos commits:

```bash
git log --oneline -10
```

Para revisar los cambios:

```bash
git diff
```

## Licencia

CywVim se distribuye bajo la licencia MIT.

Consulta:

```text
LICENSE
```

para obtener el texto completo de la licencia.

## Autor

**Cyw**

## Repositorio

```text
https://github.com/cywsb/cywvim
```
