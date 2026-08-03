" ==========================================
" Búsqueda
" ==========================================

" ------------------------------------------
" Sensibilidad de búsqueda
" ------------------------------------------

set ignorecase
set smartcase

" ------------------------------------------
" Resultados
" ------------------------------------------

set hlsearch
set incsearch
set wrapscan

" ------------------------------------------
" Autocompletado de comandos
" ------------------------------------------

set wildmenu
set wildmode=longest:full,full

" Ignorar archivos

set wildignore+=*.o,*.obj,*.pyc
set wildignore+=*.jpg,*.png,*.gif
set wildignore+=*.zip,*.tar.gz

" Ignorar carpetas

set wildignore+=*/node_modules/*
set wildignore+=*/dist/*
set wildignore+=*/build/*
set wildignore+=*/.git/*
