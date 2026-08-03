" ==================================================
" CywVim
" Funciones principales
" ==================================================

" --------------------------------------------------
" Mostrar información de la versión
" --------------------------------------------------

function! CywVersion()

    echo CywSeparator()
    echo CywCenter(g:cywvim_name)
    echo CywSeparator()

    echo 'Versión : ' . g:cywvim_version
    echo 'Autor   : ' . g:cywvim_author
    echo 'Licencia: ' . g:cywvim_license
    echo 'Vim     : ' . v:version

    echo CywSeparator()

endfunction


" --------------------------------------------------
" Mostrar ayuda
" --------------------------------------------------

function! CywHelp()

    let l:help = CywReadFile(g:cywvim_core . '/resources/help.txt')

    if empty(l:help)
        return
    endif

    new

    file CywVim-Help

    setlocal buftype=nofile
    setlocal bufhidden=wipe
    setlocal noswapfile
    setlocal nobuflisted

    setlocal nomodifiable
    setlocal nowrap

    setlocal nonumber
    setlocal norelativenumber

    call setline(1, l:help)

    setlocal nomodifiable

    normal! gg

endfunction


" --------------------------------------------------
" Verificar dependencias
" --------------------------------------------------

function! CywCheck()

    echo CywSeparator()
    echo CywCenter('CywVim Health')
    echo CywSeparator()

    let l:programs = [
                \ ['git',     'Git',      'required'],
                \ ['node',    'Node.js',  'required'],
                \ ['python3', 'Python',   'required'],
                \ ['rg',      'ripgrep',  'optional'],
                \ ['fzf',     'fzf',      'optional'],
                \ ]

    for l:item in l:programs

        if CywCheckCommand(l:item[0])

            call CywSuccess(l:item[1] . ' disponible')

        else

            if l:item[2] ==# 'required'
                call CywError(l:item[1] . ' no instalado')
            else
                call CywWarning(l:item[1] . ' no instalado')
            endif

        endif

    endfor

    echo CywSeparator()

endfunction
