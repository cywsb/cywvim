" ==================================================
" CywVim
" Health Check
" ==================================================

" --------------------------------------------------
" Verificar si un comando existe en el sistema
"
" Devuelve:
"   1 -> encontrado
"   0 -> no encontrado
" --------------------------------------------------

function! CywCheckCommand(cmd)

    return executable(a:cmd)

endfunction
