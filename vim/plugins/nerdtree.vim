" ==================================================
" CywVim
" NERDTree
" ==================================================


if exists(':NERDTreeToggle')


    " ------------------------------------------
    " Opciones
    " ------------------------------------------

    let g:NERDTreeShowHidden = 1

    let g:NERDTreeMinimalUI = 1


    " ------------------------------------------
    " Atajos
    " ------------------------------------------

    nnoremap <C-n> :NERDTreeToggle<CR>

    nnoremap <leader>f :NERDTreeFind<CR>


endif
