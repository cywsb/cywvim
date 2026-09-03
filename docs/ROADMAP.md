# CywVim — Roadmap

Hoja de ruta del proyecto CywVim.

El objetivo del roadmap es mantener una evolución controlada del proyecto,
priorizando estabilidad, compatibilidad y facilidad de mantenimiento.

---

# Estado actual

## CywVim 1.0.0

**Estado: En proceso de cierre**

La versión 1.0.0 establece la arquitectura inicial y funcional del proyecto.

Actualmente incluye:

* Interfaz de línea de comandos.
* Instalación automatizada.
* Configuración modular de Vim.
* Sistema de backup.
* Restauración de configuración.
* Instalación de dependencias.
* Gestión de Node.js.
* Instalación de vim-plug.
* Instalación de plugins.
* Instalación de extensiones COC.nvim.
* Comprobación de la instalación.
* Actualización de plugins.
* Actualización de extensiones COC.nvim.
* Desinstalación.
* Sistema de versiones.
* Documentación inicial.
* Pruebas automatizadas.

---

# Objetivos para cerrar 1.0.0

Antes de considerar CywVim 1.0.0 como versión estable se deben completar
las siguientes tareas.

## Documentación

* [x] README.md
* [x] docs/INSTALL.md
* [x] docs/FAQ.md
* [x] docs/ROADMAP.md
* [x] CHANGELOG.md
* [x] VERSION

## Instalación

* [x] Instalador principal.
* [x] Detección del sistema.
* [x] Instalación de dependencias.
* [x] Instalación de Node.js.
* [x] Instalación de vim-plug.
* [x] Instalación de configuración.
* [x] Instalación de plugins.
* [x] Instalación de extensiones COC.nvim.

## Comprobación

* [x] Comprobación de Vim.
* [x] Comprobación de Node.js.
* [x] Comprobación de npm.
* [x] Comprobación de COC.nvim.
* [x] Comprobación de vim-plug.
* [x] Comprobación de la configuración.
* [x] Comprobación de extensiones COC.nvim.
* [x] Comprobación de `crypto.randomUUID`.

## Backup y restauración

* [x] Backup antes de la instalación.
* [x] Detección del backup más reciente.
* [x] Confirmación antes de restaurar.
* [x] Restauración de `.vim`.
* [x] Restauración de `.vimrc`.
* [x] Manejo de ausencia de backup.

## Actualización

* [x] Actualización de plugins.
* [x] Actualización de extensiones COC.nvim.

## Desinstalación

* [x] Confirmación antes de desinstalar.
* [x] Eliminación de `.vim`.
* [x] Eliminación de `.vimrc`.
* [x] Oferta de restauración del backup.

## CLI

* [x] `install`
* [x] `update`
* [x] `check`
* [x] `uninstall`
* [x] `version`
* [x] `help`

## Pruebas finales

* [ ] Ejecutar todas las pruebas.
* [ ] Comprobar instalación desde cero.
* [ ] Comprobar actualización.
* [ ] Comprobar `check`.
* [ ] Comprobar desinstalación.
* [ ] Comprobar restauración del backup.
* [ ] Comprobar ejecución sin `sudo`.
* [ ] Comprobar propiedad de archivos después de la instalación.
* [ ] Revisar que no existan archivos generados como `root`.

## Git

* [ ] Revisar `gestionar_git.sh`.
* [ ] Evitar que las operaciones normales terminen generando archivos
  pertenecientes a `root`.
* [ ] Comprobar identidad de Git utilizada para nuevos commits.
* [ ] Comprobar push y pull.
* [ ] Realizar el commit final de CywVim 1.0.0.

---

# Próxima etapa — CywVim 1.1.x

Después de estabilizar 1.0.0, las versiones 1.1.x estarán orientadas a mejoras
incrementales sin modificar innecesariamente la arquitectura.

Posibles objetivos:

* Mejorar los mensajes de diagnóstico.
* Mejorar la detección de dependencias.
* Mejorar las comprobaciones de COC.nvim.
* Mejorar el manejo de errores.
* Mejorar la compatibilidad entre distribuciones.
* Ampliar las pruebas automatizadas.
* Mejorar la documentación.
* Revisar el sistema de actualización.
* Mejorar la gestión de backups.

Las funcionalidades de esta etapa se incorporarán únicamente cuando aporten
una mejora real al proyecto.

---

# Compatibilidad futura

Se podrá ampliar el soporte para otras distribuciones cuando exista una razón
para hacerlo y puedan mantenerse correctamente sus diferencias de paquetes,
rutas y herramientas.

Posibles objetivos:

* Arch Linux
* Manjaro
* Fedora
* RHEL
* Otras distribuciones compatibles

La compatibilidad no se considerará completa hasta disponer de pruebas
adecuadas para cada plataforma.

---

# CywVim 2.x

La serie 2.x queda reservada para cambios estructurales importantes.

No se planifican funcionalidades específicas para 2.x mientras la arquitectura
1.x continúe siendo suficiente.

Una futura versión mayor podría incluir:

* Cambios importantes en la arquitectura.
* Nuevos mecanismos de configuración.
* Nuevos sistemas de gestión de plugins.
* Mejoras importantes en la CLI.
* Nuevos mecanismos de detección y recuperación.
* Cambios incompatibles con versiones anteriores.

---

# Principios del roadmap

CywVim seguirá estos principios:

### Estabilidad antes que funcionalidades

No se añadirán características nuevas mientras existan problemas importantes
en la versión estable.

### Modularidad

Las nuevas funcionalidades deberán integrarse en módulos independientes
cuando sea posible.

### Automatización

Las tareas repetitivas deberán poder ejecutarse mediante la CLI.

### Seguridad

Las operaciones que modifiquen la configuración del usuario deberán evitar
pérdidas accidentales y conservar backups cuando corresponda.

### Compatibilidad

Las diferencias entre distribuciones deberán mantenerse separadas de la
lógica común.

### Mantenibilidad

Se evitarán scripts monolíticos y modificaciones innecesariamente complejas.

---

# Criterio para considerar terminada la versión 1.0.0

CywVim 1.0.0 podrá considerarse cerrada cuando:

1. La instalación funcione correctamente.
2. La actualización funcione correctamente.
3. `check` detecte correctamente los componentes.
4. La desinstalación funcione correctamente.
5. La restauración del backup funcione correctamente.
6. Las pruebas automatizadas pasen.
7. Los archivos creados por CywVim pertenezcan al usuario correcto.
8. La documentación esté completa.
9. Git esté configurado correctamente para los nuevos commits.
10. Se realice el commit final de la versión 1.0.0.

Una vez cumplidos estos puntos, CywVim 1.0.0 podrá considerarse una versión
estable y lista para uso normal.

---

# Futuro

El roadmap no es una lista rígida de funcionalidades.

Las prioridades podrán cambiar según las pruebas realizadas, problemas
detectados y necesidades reales del proyecto.

La prioridad principal seguirá siendo:

**estabilidad → seguridad → compatibilidad → mantenimiento → nuevas funciones**

