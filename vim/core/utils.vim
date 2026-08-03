" ==================================================
" CywVim
" Utilidades
" ==================================================

" --------------------------------------------------
" Leer un archivo y devolver una lista de líneas
" --------------------------------------------------

function! CywReadFile(file)

    if filereadable(a:file)
        return readfile(a:file)
    endif

    call CywError('No se encontró el archivo: ' . a:file)

    return []

endfunction


" --------------------------------------------------
" Crear una línea separadora
" --------------------------------------------------

function! CywSeparator()

    return repeat('=', g:cywvim_width)

endfunction


" --------------------------------------------------
" Centrar un texto
" --------------------------------------------------

function! CywCenter(text)

    let l:width = g:cywvim_width
    let l:padding = (l:width - strdisplaywidth(a:text)) / 2

    if l:padding < 0
        let l:padding = 0
    endif

    return repeat(' ', float2nr(l:padding)) . a:text

endfunction
