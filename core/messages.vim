" ==================================================
" CywVim
" Sistema de Mensajes
" ==================================================

function! s:CywMessage(prefix, msg, highlight)

    if !empty(a:highlight)
        execute 'echohl ' . a:highlight
    endif

    echo '[' . a:prefix . '] ' . a:msg

    if !empty(a:highlight)
        echohl None
    endif

endfunction


function! CywInfo(msg)

    call s:CywMessage('INFO', a:msg, '')

endfunction


function! CywSuccess(msg)

    call s:CywMessage('OK', a:msg, 'Directory')

endfunction


function! CywWarning(msg)

    call s:CywMessage('WARN', a:msg, 'WarningMsg')

endfunction


function! CywError(msg)

    call s:CywMessage('ERROR', a:msg, 'ErrorMsg')

endfunction
