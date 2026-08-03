" ==================================================
" CywVim v1.0
" Atajos de teclado
" ==================================================


" Leader

let mapleader = " "


" ==================================================
" Guardar / salir
" ==================================================

nnoremap <C-s> :w<CR>

inoremap <C-s> <Esc>:w<CR>a

cnoremap <C-s> <C-c>:w<CR>


nnoremap <C-q> :q<CR>

nnoremap <leader>wq :wq<CR>



" ==================================================
" Movimiento entre ventanas
" ==================================================

nnoremap <C-h> <C-w>h

nnoremap <C-j> <C-w>j

nnoremap <C-k> <C-w>k

nnoremap <C-l> <C-w>l



" ==================================================
" Pestañas
" ==================================================

nnoremap gt :tabnext<CR>

nnoremap gT :tabprevious<CR>



" ==================================================
" Buffers
" ==================================================

nnoremap <S-l> :bnext<CR>

nnoremap <S-h> :bprevious<CR>



" ==================================================
" FZF
" ==================================================

nnoremap <C-p> :Files<CR>

nnoremap <leader>rg :Rg<CR>



" ==================================================
" Movimiento de líneas
" ==================================================

nnoremap <A-j> :m .+1<CR>==

nnoremap <A-k> :m .-2<CR>==


inoremap <A-j> <Esc>:m .+1<CR>==gi

inoremap <A-k> <Esc>:m .-2<CR>==gi



" ==================================================
" Mejoras visuales
" ==================================================

nnoremap <leader><space> :noh<CR>


" ==================================================
" CywVim
" Recargar configuración
" ==================================================

nnoremap <leader>vr :source ~/.vimrc<CR>
