" ==========================================
" Configuración general
" ==========================================

" Modo moderno
set nocompatible

" Sintaxis
syntax enable
filetype plugin indent on

" Codificación
set encoding=utf-8
set fileencoding=utf-8

" Historial
set history=1000

" ------------------------------------------
" Directorios
" ------------------------------------------

if !isdirectory(expand('~/.vim/undo'))
    call mkdir(expand('~/.vim/undo'), 'p')
endif

if !isdirectory(expand('~/.vim/backup'))
    call mkdir(expand('~/.vim/backup'), 'p')
endif

if !isdirectory(expand('~/.vim/swap'))
    call mkdir(expand('~/.vim/swap'), 'p')
endif

" Undo
set undofile
set undodir=~/.vim/undo

" Backup
set backup
set backupdir=~/.vim/backup

" Swap
set directory=~/.vim/swap

" Buffers
set hidden
