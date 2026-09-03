# CywVim — FAQ

Preguntas frecuentes sobre instalación, configuración, actualización,
comprobación y desinstalación de CywVim.

---

## General

### ¿Qué es CywVim?

CywVim es una configuración modular y automatizada de Vim para Debian,
Ubuntu, Linux Mint y otras distribuciones compatibles.

El proyecto organiza la instalación de Vim, plugins, COC.nvim, Node.js,
configuración y herramientas de desarrollo mediante módulos independientes.

### ¿Cuál es la versión actual?

La versión actual es:

```text
1.0.0
```

La versión se encuentra definida en:

```text
VERSION
```

### ¿Dónde está el repositorio?

El repositorio oficial es:

```text
https://github.com/cywsb/cywvim
```

---

# Instalación

### ¿Cómo instalo CywVim?

Clona el repositorio:

```bash
git clone https://github.com/cywsb/cywvim.git
```

Entra al directorio:

```bash
cd cywvim
```

Ejecuta:

```bash
./bin/cywvim install
```

### ¿Necesito ejecutar el instalador con `sudo`?

No.

La forma recomendada es:

```bash
./bin/cywvim install
```

CywVim utiliza `sudo` internamente cuando necesita privilegios para instalar
paquetes del sistema.

No se recomienda:

```bash
sudo ./bin/cywvim install
```

porque puede provocar que archivos de configuración del usuario terminen
siendo propiedad de `root`.

### ¿Qué hace `cywvim install`?

El instalador principal:

1. Detecta el sistema operativo.
2. Crea un backup de la configuración existente.
3. Instala las dependencias.
4. Comprueba Node.js.
5. Instala Node.js si es necesario.
6. Instala vim-plug.
7. Instala la configuración de Vim.
8. Instala los plugins.
9. Instala las extensiones de COC.nvim.

---

# Comandos

### ¿Qué comandos proporciona CywVim?

```text
install
update
check
uninstall
version
help
```

Se pueden consultar desde:

```bash
./bin/cywvim help
```

### ¿Cómo instalo?

```bash
./bin/cywvim install
```

### ¿Cómo actualizo?

```bash
./bin/cywvim update
```

Actualiza los plugins y las extensiones de COC.nvim.

### ¿Cómo compruebo la instalación?

```bash
./bin/cywvim check
```

### ¿Cómo desinstalo?

```bash
./bin/cywvim uninstall
```

### ¿Cómo consulto la versión?

```bash
./bin/cywvim version
```

### ¿Cómo consulto la ayuda?

```bash
./bin/cywvim help
```

---

# Node.js

### ¿Por qué CywVim necesita Node.js?

COC.nvim utiliza Node.js para ejecutar su servidor y determinadas extensiones
relacionadas con los lenguajes de programación.

### ¿Cuál es la versión mínima de Node.js?

CywVim 1.0.0 utiliza:

```text
NODE_MIN_VERSION=24
```

El valor se encuentra en:

```text
resources/versions.conf
```

### ¿Qué ocurre si tengo una versión antigua de Node.js?

CywVim comprueba la versión existente.

Si no cumple el mínimo requerido, configura NodeSource e instala una versión
compatible.

### ¿Cómo compruebo mi versión de Node.js?

```bash
node --version
```

También puedes comprobar npm:

```bash
npm --version
```

---

# COC.nvim

### ¿Qué es COC.nvim?

COC.nvim proporciona integración con herramientas de desarrollo y servidores
de lenguaje dentro de Vim.

CywVim lo utiliza para proporcionar soporte para diferentes lenguajes.

### ¿Qué extensiones instala CywVim?

La lista oficial está en:

```text
resources/coc_extensions.txt
```

Actualmente contiene:

```text
coc-json
coc-html
coc-css
coc-tsserver
coc-pyright
coc-sh
coc-snippets
```

### ¿Qué lenguajes cubren estas extensiones?

La configuración actual proporciona soporte para:

* JSON
* HTML
* CSS
* JavaScript
* TypeScript
* Python
* Shell / Bash
* Snippets

### ¿Cómo compruebo las extensiones?

Ejecuta:

```bash
./bin/cywvim check
```

El sistema verifica que cada extensión definida en
`resources/coc_extensions.txt` exista en el directorio de extensiones de
COC.nvim.

---

# Node.js y `crypto.randomUUID`

### ¿Por qué `check` comprueba `crypto.randomUUID`?

Determinadas versiones y herramientas del ecosistema de COC.nvim pueden
depender de funcionalidades modernas de Node.js.

CywVim comprueba específicamente la disponibilidad de:

```text
crypto.randomUUID
```

La comprobación se realiza mediante Node.js.

### ¿Qué hago si aparece `crypto.randomUUID no disponible`?

Primero comprueba:

```bash
node --version
```

CywVim 1.0.0 requiere Node.js 24 como mínimo.

También puedes ejecutar nuevamente:

```bash
./bin/cywvim check
```

---

# Vim

### ¿Cuál es la versión mínima de Vim?

Actualmente:

```text
VIM_MIN_VERSION=9
```

Está definida en:

```text
resources/versions.conf
```

### ¿Cómo compruebo la versión de Vim?

```bash
vim --version | head -n 1
```

### ¿Dónde se instala la configuración?

CywVim utiliza:

```text
~/.vim
```

y:

```text
~/.vimrc
```

La configuración principal del proyecto está en:

```text
vim/vimrc
```

### ¿Qué es el loader de `.vimrc`?

El archivo:

```text
~/.vimrc
```

actúa como loader de la configuración principal:

```text
~/.vim/vimrc
```

Esto permite mantener organizada la configuración de Vim.

---

# Plugins

### ¿Qué plugins utiliza CywVim?

La configuración actual contempla:

* vim-plug
* Gruvbox
* NERDTree
* Airline
* GitGutter
* FZF
* COC.nvim

### ¿Cómo actualizo los plugins?

```bash
./bin/cywvim update
```

---

# Backup

### ¿CywVim crea un backup antes de instalar?

Sí.

Antes de modificar la configuración del usuario, el instalador ejecuta el
módulo de backup.

### ¿Dónde se guarda el backup?

En el directorio personal del usuario con un nombre similar a:

```text
~/.cywvim_backup_YYYYMMDD_HHMMSS
```

### ¿Qué archivos puede contener?

Principalmente:

```text
.vim
.vimrc
```

### ¿Se crea un backup cada vez que ejecuto la instalación?

El comportamiento depende de la ejecución del módulo de backup. Los backups
existentes no deben eliminarse manualmente hasta comprobar que ya no son
necesarios.

---

# Restauración

### ¿Puedo recuperar mi configuración anterior?

Sí.

Al desinstalar CywVim:

```bash
./bin/cywvim uninstall
```

el sistema busca el backup más reciente que contenga:

```text
.vim
```

o:

```text
.vimrc
```

### ¿La restauración es automática?

No.

El desinstalador muestra el backup encontrado y solicita confirmación.

Esto evita restauraciones accidentales.

### ¿Qué ocurre si no existe ningún backup?

El sistema muestra una advertencia:

```text
No se encontró ningún backup.
```

y continúa con la desinstalación.

---

# Desinstalación

### ¿Qué elimina `cywvim uninstall`?

Después de confirmar, el desinstalador elimina:

```text
~/.vim
```

y:

```text
~/.vimrc
```

Después busca un backup disponible para ofrecer su restauración.

### ¿Se eliminan los backups?

No forman parte de la eliminación normal de la configuración.

Los backups se mantienen para permitir recuperar la configuración anterior.

---

# Comprobación

### ¿Qué hace `cywvim check`?

El comando:

```bash
./bin/cywvim check
```

comprueba diferentes componentes de la instalación.

Entre ellos:

* versión de Vim
* existencia de `~/.vim`
* existencia de `~/.vimrc`
* loader de Vim
* vim-plug
* configuración principal
* directorios de configuración
* Node.js
* versión mínima de Node.js
* npm
* `crypto.randomUUID`
* COC.nvim
* extensiones de COC.nvim

### ¿Qué significa una advertencia?

Una advertencia indica que un componente no cumple la condición esperada.

Por ejemplo:

```text
Node.js v18.x (mínimo requerido: 24)
```

significa que Node.js está instalado, pero su versión es inferior al mínimo
requerido.

### ¿Qué debo hacer si `check` muestra una advertencia?

Primero identifica qué componente aparece como incorrecto.

Puedes comprobar manualmente:

```bash
node --version
```

```bash
npm --version
```

```bash
vim --version | head -n 1
```

y volver a ejecutar:

```bash
./bin/cywvim check
```

---

# Distribuciones

### ¿Qué distribuciones contempla CywVim?

La arquitectura actual contempla:

* Debian
* Ubuntu
* Linux Mint
* Arch Linux
* Manjaro
* Fedora
* RHEL

### ¿Qué gestores de paquetes utiliza?

Debian, Ubuntu y Linux Mint:

```text
apt
```

Arch Linux y Manjaro:

```text
pacman
```

Fedora y RHEL:

```text
dnf
```

### ¿Qué ocurre si la distribución no está soportada?

CywVim detiene la operación e informa que la distribución no está soportada.

---

# Permisos

### ¿Por qué no debo ejecutar CywVim como `root`?

CywVim trabaja con archivos de configuración pertenecientes al usuario.

Ejecutar:

```bash
sudo ./bin/cywvim install
```

puede hacer que algunos archivos terminen siendo propiedad de `root`.

La forma recomendada es:

```bash
./bin/cywvim install
```

y dejar que CywVim utilice `sudo` solamente cuando sea necesario.

### ¿Cómo compruebo el propietario de mi configuración?

```bash
ls -ld ~/.vim
```

```bash
ls -l ~/.vimrc
```

El propietario debe ser el usuario que utiliza Vim.

---

# Git

### ¿Cómo compruebo el estado del repositorio?

Desde el directorio de CywVim:

```bash
git status
```

### ¿Cómo veo los últimos commits?

```bash
git log --oneline -10
```

### ¿Cómo veo los cambios pendientes?

```bash
git diff
```

### ¿Cómo compruebo la identidad configurada para Git?

```bash
git config --show-origin --get-regexp 'user\.(name|email)'
```

### ¿Por qué algunos commits antiguos aparecen como `root`?

Los commits anteriores pueden haber sido creados mientras el proceso se
ejecutaba con la identidad de `root`.

Cambiar la configuración actual de Git no modifica automáticamente los
commits históricos.

Para los nuevos commits debe utilizarse la identidad correcta del usuario.

---

# Solución de problemas

### El comando `./bin/cywvim` no se puede ejecutar

Comprueba los permisos:

```bash
chmod +x bin/cywvim
```

Después:

```bash
./bin/cywvim help
```

### Aparece `Node.js no instalado`

Comprueba:

```bash
node --version
```

Si no existe, ejecuta:

```bash
./bin/cywvim install
```

### Aparece una versión de Node.js inferior a 24

Comprueba:

```bash
node --version
```

CywVim 1.0.0 requiere:

```text
Node.js >= 24
```

### Aparece `coc.nvim incompleto o no instalado`

Ejecuta:

```bash
./bin/cywvim check
```

Comprueba que Vim, vim-plug y COC.nvim estén instalados correctamente.

### Falta una extensión de COC.nvim

Revisa:

```text
resources/coc_extensions.txt
```

Después ejecuta:

```bash
./bin/cywvim update
```

### El instalador solicita la contraseña

Es normal.

CywVim utiliza `sudo` para realizar operaciones que requieren privilegios
administrativos, como instalar paquetes del sistema.

### El proyecto muestra archivos propiedad de `root`

Comprueba:

```bash
ls -la
```

y:

```bash
ls -ld ~/.vim
```

No ejecutes normalmente CywVim utilizando `sudo`.

---

# Desarrollo

### ¿Cómo compruebo si tengo cambios locales?

```bash
git status
```

### ¿Cómo veo los cambios de un archivo?

```bash
git diff -- archivo
```

### ¿Cómo veo los últimos commits con autor?

```bash
git log -5 --format='%h | %an <%ae> | %s'
```

### ¿Dónde se encuentra la configuración de versiones?

```text
resources/versions.conf
```

Actualmente:

```text
NODE_MIN_VERSION=24
VIM_MIN_VERSION=9
```

### ¿Dónde se define la lista de extensiones?

```text
resources/coc_extensions.txt
```

---

# Documentación

La documentación principal se encuentra en:

```text
README.md
docs/INSTALL.md
docs/FAQ.md
docs/ROADMAP.md
CHANGELOG.md
```

### ¿Dónde puedo consultar la instalación detallada?

```text
docs/INSTALL.md
```

### ¿Dónde puedo consultar preguntas frecuentes?

```text
docs/FAQ.md
```

### ¿Dónde puedo consultar los planes futuros?

```text
docs/ROADMAP.md
```

### ¿Dónde puedo consultar los cambios de versión?

```text
CHANGELOG.md
```

---

# Filosofía de CywVim

CywVim busca mantener una configuración de Vim:

* modular
* automatizada
* fácil de instalar
* fácil de comprobar
* fácil de actualizar
* fácil de desinstalar
* preparada para futuras versiones

La versión 1.0.0 establece la arquitectura inicial del proyecto.

Las funcionalidades futuras deben incorporarse manteniendo esta separación
entre comandos, módulos, recursos, configuración y pruebas.

