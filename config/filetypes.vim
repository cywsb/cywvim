" ==================================================
" CywVim
" Filetypes
" ==================================================


augroup CywVimFileTypes

    autocmd!

    " ------------------------------------------
    " Python
    " ------------------------------------------

    autocmd FileType python setlocal tabstop=4 shiftwidth=4 expandtab


    " ------------------------------------------
    " HTML
    " ------------------------------------------

    autocmd FileType html setlocal tabstop=2 shiftwidth=2 expandtab


    " ------------------------------------------
    " CSS
    " ------------------------------------------

    autocmd FileType css setlocal tabstop=2 shiftwidth=2 expandtab


    " ------------------------------------------
    " Javascript
    " ------------------------------------------

    autocmd FileType javascript setlocal tabstop=2 shiftwidth=2 expandtab


    " ------------------------------------------
    " YAML
    " ------------------------------------------

    autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 expandtab


    " ------------------------------------------
    " Shell
    " ------------------------------------------

    autocmd FileType sh setlocal tabstop=4 shiftwidth=4 expandtab


    " ------------------------------------------
    " JSON
    " ------------------------------------------

    autocmd FileType json setlocal tabstop=2 shiftwidth=2 expandtab


    " ------------------------------------------
    " Docker
    " ------------------------------------------

    autocmd FileType dockerfile setlocal tabstop=4 shiftwidth=4 expandtab


    " ------------------------------------------
    " SQL
    " ------------------------------------------

    autocmd FileType sql setlocal tabstop=4 shiftwidth=4 expandtab


augroup END
