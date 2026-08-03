" ==================================================
" CywVim v1.0
" Configuración principal
" ==================================================

scriptencoding utf-8
set nocompatible

" ==================================================
" Evitar cargar dos veces la configuración
" ==================================================

if exists('g:loaded_cywvim')
    finish
endif

let g:loaded_cywvim = 1


" ==================================================
" Detectar automáticamente la carpeta de CywVim
" ==================================================

let s:base_path   = fnamemodify(expand('<sfile>:p'), ':h')
let s:config_path = s:base_path . '/config'
let s:core_path   = s:base_path . '/core'


" ==================================================
" Variables globales
" ==================================================

let g:cywvim_root   = s:base_path
let g:cywvim_config = s:config_path
let g:cywvim_core   = s:core_path


" ==================================================
" Core
" ==================================================

execute 'source ' . s:core_path . '/version.vim'
execute 'source ' . s:core_path . '/messages.vim'
execute 'source ' . s:core_path . '/utils.vim'
execute 'source ' . s:core_path . '/functions.vim'
execute 'source ' . s:core_path . '/health.vim'
execute 'source ' . s:core_path . '/commands.vim'


" ==================================================
" Configuración base
" ==================================================

" --------------------------------------------------
" Configuración general
" --------------------------------------------------

execute 'source ' . s:config_path . '/general.vim'

" --------------------------------------------------
" Apariencia
" --------------------------------------------------

execute 'source ' . s:config_path . '/appearance.vim'

" --------------------------------------------------
" Edición
" --------------------------------------------------

execute 'source ' . s:config_path . '/editing.vim'

" --------------------------------------------------
" Búsqueda
" --------------------------------------------------

execute 'source ' . s:config_path . '/search.vim'

" --------------------------------------------------
" Tipos de archivo
" --------------------------------------------------

execute 'source ' . s:config_path . '/filetypes.vim'


" ==================================================
" Plugins
" ==================================================

execute 'source ' . s:config_path . '/plugins.vim'


" ==================================================
" Configuración de Plugins
" ==================================================

" --------------------------------------------------
" Tema Gruvbox
" --------------------------------------------------

execute 'source ' . s:config_path . '/colors.vim'

" --------------------------------------------------
" Explorador de archivos
" --------------------------------------------------

execute 'source ' . s:config_path . '/nerdtree.vim'

" --------------------------------------------------
" Barra de estado
" --------------------------------------------------

execute 'source ' . s:config_path . '/airline.vim'

" --------------------------------------------------
" Git
" --------------------------------------------------

execute 'source ' . s:config_path . '/git.vim'

" --------------------------------------------------
" Paréntesis automáticos
" --------------------------------------------------

execute 'source ' . s:config_path . '/autopairs.vim'

" --------------------------------------------------
" Autocompletado (COC)
" --------------------------------------------------

execute 'source ' . s:config_path . '/coc.vim'


" ==================================================
" Atajos de teclado
" ==================================================

execute 'source ' . s:config_path . '/mappings.vim'
