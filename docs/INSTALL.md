# Guía de instalación de CywVim

Esta guía explica cómo instalar, comprobar, actualizar y desinstalar CywVim.

CywVim está diseñado para proporcionar una configuración modular de Vim junto
con plugins, COC.nvim y sus herramientas de desarrollo.

## 1. Requisitos

CywVim está preparado para trabajar con las siguientes familias de
distribuciones:

- Debian
- Ubuntu
- Linux Mint
- Arch Linux
- Manjaro
- Fedora
- RHEL

La instalación de dependencias utiliza el gestor de paquetes correspondiente
a cada familia.

Para Debian, Ubuntu y Linux Mint se utiliza `apt`.

Para Arch Linux y Manjaro se utiliza `pacman`.

Para Fedora y RHEL se utiliza `dnf`.

También se requiere:

- Bash
- conexión a Internet
- permisos para utilizar `sudo`
- Vim
- curl

Node.js es necesario para COC.nvim. CywVim utiliza Node.js 24 como versión
mínima.

## 2. Obtener CywVim

Clona el repositorio:

```bash
git clone https://github.com/cywsb/cywvim.git
```

Entra al directorio:

```bash
cd cywvim
```

Puedes comprobar que estás en el proyecto con:

```bash
pwd
```

y:

```bash
ls
```

## 3. Instalar CywVim

El punto de entrada principal de CywVim es:

```text
bin/cywvim
```

Para instalar:

```bash
./bin/cywvim install
```

El instalador principal ejecuta los módulos de instalación en este orden:

1. Detecta el sistema.
2. Crea un backup de la configuración existente.
3. Instala las dependencias.
4. Verifica e instala Node.js cuando sea necesario.
5. Instala vim-plug.
6. Instala la configuración de Vim.
7. Instala los plugins.
8. Instala las extensiones de COC.nvim.

## 4. Backup automático

Antes de modificar la configuración existente, CywVim crea un backup.

Los backups se almacenan en el directorio personal del usuario con un nombre
similar a:

```text
~/.cywvim_backup_YYYYMMDD_HHMMSS
```

El backup puede contener:

```text
.vim
.vimrc
```

Esto permite recuperar la configuración anterior si posteriormente se
desinstala CywVim.

## 5. Dependencias

El módulo:

```text
scripts/install/dependencies.sh
```

selecciona automáticamente el archivo de paquetes según la distribución.

Los archivos de paquetes se encuentran en:

```text
resources/packages_debian.txt
resources/packages_arch.txt
resources/packages_fedora.txt
```

En sistemas Debian, Ubuntu y Linux Mint se ejecuta:

```bash
sudo apt update
sudo apt install ...
```

En Arch Linux y Manjaro:

```bash
sudo pacman -Sy --needed --noconfirm ...
```

En Fedora y RHEL:

```bash
sudo dnf install -y ...
```

No es necesario ejecutar manualmente estos comandos cuando se utiliza el
instalador de CywVim.

## 6. Node.js

COC.nvim necesita Node.js.

La versión mínima definida por CywVim se encuentra en:

```text
resources/versions.conf
```

Actualmente:

```text
NODE_MIN_VERSION=24
```

El instalador:

1. Comprueba si Node.js está instalado.
2. Obtiene la versión instalada.
3. Comprueba si cumple la versión mínima.
4. Si no existe o es demasiado antigua, configura NodeSource.
5. Instala Node.js mediante el gestor de paquetes.
6. Verifica nuevamente la versión instalada.

Para comprobar manualmente la versión:

```bash
node --version
```

y:

```bash
npm --version
```

## 7. Verificar la instalación

Después de instalar CywVim se recomienda ejecutar:

```bash
./bin/cywvim check
```

La comprobación revisa componentes como:

- versión de Vim
- directorio `~/.vim`
- archivo `~/.vimrc`
- loader de Vim
- vim-plug
- configuración principal
- directorios de CywVim
- Node.js
- npm
- `crypto.randomUUID`
- COC.nvim
- extensiones de COC.nvim

Una instalación correcta debería mostrar los componentes disponibles como
correctos y advertir únicamente de elementos que realmente no estén
instalados o configurados.

## 8. Actualizar CywVim

Para actualizar plugins y extensiones de COC.nvim:

```bash
./bin/cywvim update
```

El comando utiliza los módulos:

```text
scripts/update/plugins.sh
scripts/update/coc.sh
```

La actualización no reinstala toda la configuración.

## 9. Desinstalar CywVim

Para desinstalar:

```bash
./bin/cywvim uninstall
```

El proceso solicita confirmación antes de realizar cambios.

Después:

1. Elimina `~/.vim`.
2. Elimina `~/.vimrc`.
3. Busca el backup más reciente.
4. Muestra el backup encontrado.
5. Pregunta si deseas restaurarlo.

La restauración es opcional.

## 10. Comandos disponibles

Todos los comandos se ejecutan mediante:

```bash
./bin/cywvim <comando>
```

### Instalar

```bash
./bin/cywvim install
```

### Actualizar

```bash
./bin/cywvim update
```

### Comprobar

```bash
./bin/cywvim check
```

### Desinstalar

```bash
./bin/cywvim uninstall
```

### Mostrar versión

```bash
./bin/cywvim version
```

### Mostrar ayuda

```bash
./bin/cywvim help
```

## 11. Problemas de permisos

CywVim utiliza `sudo` únicamente para operaciones que requieren privilegios
del sistema, como la instalación de paquetes.

La configuración de Vim pertenece al usuario que ejecuta CywVim y se instala
en su directorio personal.

Se recomienda ejecutar CywVim como el usuario normal:

```bash
./bin/cywvim install
```

No se recomienda ejecutar:

```bash
sudo ./bin/cywvim install
```

Ejecutar el instalador completo como `root` puede provocar que archivos de
configuración pertenezcan a `root` en lugar del usuario normal.

## 12. Comprobaciones útiles

Para comprobar el estado de Git:

```bash
git status
```

Para revisar los últimos commits:

```bash
git log --oneline -10
```

Para revisar cambios locales:

```bash
git diff
```

Para comprobar la versión instalada de Vim:

```bash
vim --version | head -n 1
```

Para comprobar Node.js:

```bash
node --version
```

Para comprobar npm:

```bash
npm --version
```

## 13. Estructura relacionada con la instalación

La instalación está separada en módulos:

```text
scripts/
├── commands/
│   └── install.sh
│
└── install/
    ├── backup.sh
    ├── dependencies.sh
    ├── node.sh
    ├── vim_plug.sh
    ├── configuration.sh
    ├── plugins.sh
    └── coc.sh
```

El comando:

```text
scripts/commands/install.sh
```

coordina estos módulos.

Las versiones mínimas se mantienen de forma centralizada en:

```text
resources/versions.conf
```

## 14. Desinstalación sin perder la configuración anterior

Si quieres conservar la configuración existente, no elimines manualmente
`~/.vim` o `~/.vimrc` antes de ejecutar el desinstalador.

CywVim crea el backup antes de modificar la configuración.

Posteriormente:

```bash
./bin/cywvim uninstall
```

permite restaurar el backup encontrado.

## 15. Recomendación después de instalar

Una vez terminada la instalación:

```bash
./bin/cywvim check
```

Después puedes iniciar Vim:

```bash
vim
```

Si COC.nvim utiliza extensiones de lenguaje, puedes comprobar su estado
desde Vim y revisar cualquier mensaje que aparezca durante el inicio.

## 16. Notas para CywVim 1.0.0

CywVim 1.0.0 establece la arquitectura modular inicial del proyecto.

La configuración se encuentra separada de los scripts y de los recursos para
facilitar futuras versiones.

Los cambios futuros deben mantener esta separación siempre que sea posible.

Para conocer los cambios de cada versión consulta:

```text
CHANGELOG.md
```

Para conocer la planificación futura consulta:

```text
docs/ROADMAP.md
```
