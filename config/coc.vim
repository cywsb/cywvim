" ==================================================
" CywVim v1.0
" COC.nvim configuración
" ==================================================


set updatetime=300

set signcolumn=yes


" ==================================================
" Autocompletado
" ==================================================

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()


inoremap <silent><expr> <S-TAB>
      \ coc#pum#visible() ? coc#pum#prev(1) :
      \ "\<C-h>"


function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction



" ==================================================
" Navegación
" ==================================================

nnoremap gd <Plug>(coc-definition)

nnoremap gr <Plug>(coc-references)

nnoremap K :call CocActionAsync('doHover')<CR>

nnoremap <leader>rn <Plug>(coc-rename)



" ==================================================
" Diagnóstico
" ==================================================

nnoremap [g <Plug>(coc-diagnostic-prev)

nnoremap ]g <Plug>(coc-diagnostic-next)

nnoremap <leader>d :CocDiagnostics<CR>



" ==================================================
" Formato
" ==================================================

command! -nargs=0 Format :call CocActionAsync('format')

nnoremap <leader>fm :Format<CR>



" ==================================================
" Utilidades CoC
" ==================================================

nnoremap <leader>cr :CocRestart<CR>

nnoremap <leader>ce :CocList extensions<CR>
