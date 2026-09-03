# Changelog

Todos los cambios importantes de CywVim se documentarán en este archivo.

El formato está basado en [Keep a Changelog](https://keepachangelog.com/)
y el proyecto utiliza versionado semántico.

---

# [1.0.0] — 2026-08-17

## Added

### CLI

* Añadida interfaz de línea de comandos mediante `bin/cywvim`.
* Añadidos los comandos:

  * `install`
  * `update`
  * `check`
  * `uninstall`
  * `version`
  * `help`

### Instalación

* Añadido instalador modular.
* Añadida detección de distribución.
* Añadida instalación automatizada de dependencias.
* Añadida instalación de Node.js.
* Añadida instalación de vim-plug.
* Añadida instalación de la configuración de Vim.
* Añadida instalación de plugins.
* Añadida instalación de extensiones de COC.nvim.

### Node.js

* Añadida comprobación de versión mínima.
* Establecido Node.js 24 como versión mínima para CywVim 1.0.0.
* Añadida configuración automática de NodeSource para sistemas compatibles.

### Vim

* Añadida configuración modular de Vim.
* Añadido sistema de loader mediante `.vimrc`.
* Añadida comprobación de la instalación de Vim.
* Añadida comprobación de vim-plug.
* Añadida comprobación de la estructura de configuración.

### COC.nvim

* Añadida integración con COC.nvim.
* Añadidas extensiones para:

  * JSON
  * HTML
  * CSS
  * JavaScript / TypeScript
  * Python
  * Shell / Bash
  * Snippets

Extensiones definidas en:

```text
resources/coc_extensions.txt
```

### Backup y restauración

* Añadido sistema de backup antes de la instalación.
* Añadida detección del backup más reciente.
* Añadida restauración de `.vim`.
* Añadida restauración de `.vimrc`.
* Añadida confirmación antes de restaurar.
* Añadido manejo de ausencia de backups.

### Comprobación

* Añadido comando `check`.
* Añada comprobación de Node.js.
* Añadida comprobación de npm.
* Añadida comprobación de `crypto.randomUUID`.
* Añadida comprobación de COC.nvim.
* Añadida comprobación de extensiones.
* Añadida comprobación de Vim.
* Añadida comprobación de vim-plug.
* Añadida comprobación de archivos y directorios de configuración.

### Actualización

* Añadido sistema de actualización de plugins.
* Añadida actualización de extensiones de COC.nvim.

### Desinstalación

* Añadado comando de desinstalación.
* Añadida confirmación antes de eliminar la configuración.
* Añadida eliminación de `.vim`.
* Añadida eliminación de `.vimrc`.
* Añadida opción de restaurar el backup.

### Configuración

* Añadido archivo centralizado de versiones:

  * `resources/versions.conf`
* Añadidos archivos de paquetes por distribución.
* Añadido archivo de configuración de extensiones COC.nvim.
* Añadida estructura modular para scripts de instalación, comprobación,
  actualización y desinstalación.

### Documentación

* Añadido `README.md`.
* Añadido `docs/INSTALL.md`.
* Añadido `docs/FAQ.md`.
* Añadido `docs/ROADMAP.md`.
* Añadido `CHANGELOG.md`.

### Pruebas

* Añadida estructura inicial de pruebas.
* Añadidos:

  * `tests/test_health.sh`
  * `tests/test_install.sh`
  * `tests/test_update.sh`

---

## Changed

* Se reorganizó el proyecto desde una configuración de Vim independiente
  hacia una arquitectura modular.
* Se centralizó la configuración común en `scripts/common.sh`.
* Se centralizaron las versiones mínimas en `resources/versions.conf`.
* Se separaron las operaciones de instalación, comprobación, actualización y
  desinstalación en módulos independientes.
* Se mejoró la validación de las dependencias necesarias para la instalación.
* Se mejoró la comprobación de Node.js utilizado por COC.nvim.

---

## Fixed

* Corregidos problemas relacionados con la detección de versiones de
  Node.js.
* Corregida la gestión de extensiones de COC.nvim.
* Corregida la estructura del proceso de desinstalación y restauración.
* Corregidos problemas relacionados con la organización modular de los
  scripts.

---

## Security

* El instalador utiliza privilegios administrativos únicamente para las
  operaciones que requieren `sudo`.
* La configuración del usuario se mantiene separada de las operaciones
  administrativas.
* Se crea un backup antes de modificar la configuración existente.

---

# Próximamente

Los cambios posteriores a 1.0.0 se documentarán en nuevas versiones.

Las mejoras previstas se encuentran en:

```text
docs/ROADMAP.md
```

---

# Formato de versiones

CywVim utiliza versionado semántico:

```text
MAJOR.MINOR.PATCH
```

Por ejemplo:

```text
1.0.0
1.1.0
1.1.1
2.0.0
```

Los cambios incompatibles podrán incrementar la versión `MAJOR`.

Las nuevas funcionalidades compatibles podrán incrementar `MINOR`.

Las correcciones y cambios menores podrán incrementar `PATCH`.

